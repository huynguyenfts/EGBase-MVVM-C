//
//  RepoCoordinator.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/9/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator

enum SearchRepoRoute: Route {
    case searchRepo
    case userList
}

class SearchRepoCoordinator: NavigationCoordinator<SearchRepoRoute> {
    
    init() {
        super.init(initialRoute: .searchRepo)
    }
    
    override func prepareTransition(for route: SearchRepoRoute) -> NavigationTransition {
        switch route {
        case .searchRepo:
            let searchRepo = SearchRepoViewController.fromStoryboard(.search)
            let viewModel = SearchRepoViewModel.init(router: anyRouter)
            searchRepo.bind(to: viewModel)
            return .push(searchRepo)
        case .userList:
            let vc = UIViewController()
            vc.view.backgroundColor = .white
            return .push(vc)
        }
    }
}
