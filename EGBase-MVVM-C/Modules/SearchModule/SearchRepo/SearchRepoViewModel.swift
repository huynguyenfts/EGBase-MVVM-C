//
//  SearchRepoViewModel.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import Alamofire
import XCoordinator

protocol SearchRepoViewModelDelegate: class {
    func searchRepoError(apiStatus: APIStatus)
}

class SearchRepoViewModel {

    // MARK: - Variable
    private let router: AnyRouter<SearchRepoRoute>
    weak var delegate: SearchRepoViewModelDelegate?
    
    var searchText = Dynamic<String>("")
    var repos = Dynamic<[Repo]>([])
    var currentPage = 0
    var maxPage = 0
    var lastKeyword: String?
    // MARK: - Init
    
    init(router: AnyRouter<SearchRepoRoute>) {
        self.router = router
    }
    
    // MARK: - Navigator
    
    
    // MARK: - Logic
    func searchRepo(with keyword: String?) {
        
        if lastKeyword != keyword {
            currentPage = 0
            maxPage = 0
            repos.value = []
        }
        
        if currentPage == 0 || needLoadMore() == true {
            requestSearchRepo(with: keyword)
        }
    }
    
    func requestSearchRepo(with keyword: String?) {

        _ = SearchRepoService.searchRepo(keyword: keyword, page: currentPage) { [weak self](response) in
            guard let strongSelf = self else { return }

            if response.status.statusCode == .success {
                if let repos = response.data?.repos, repos.count > 0 {
                    strongSelf.lastKeyword = keyword
                    strongSelf.maxPage = strongSelf.getTotalPage(total: response.data?.totalCount)

                    strongSelf.repos.value.append(contentsOf: repos)
                } else {
                    strongSelf.repos.value = []
                }
            } else {
                strongSelf.repos.value = []
                strongSelf.delegate?.searchRepoError(apiStatus: response.status)
            }
        }
    }
    
    
    func needLoadMore() -> Bool {
        if currentPage < maxPage {
            currentPage += 1
            return true
        }
        return false
    }
    
    func getTotalPage(total: Int?) -> Int {
        guard let total = total else { return 0 }
        if total % Constant.maxItemPerPage == 0 {
            return total/Constant.maxItemPerPage
        }
        return Int(total / Constant.maxItemPerPage) + 1
    }

}
