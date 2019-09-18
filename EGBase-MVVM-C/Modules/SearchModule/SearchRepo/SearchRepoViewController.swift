//
//  SearchRepoViewController.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit

class SearchRepoViewController: BaseViewController, BindableType {

    var viewModel: SearchRepoViewModel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        defaultSearch()
    }
    
    func bindViewModel() {
        
    }
    
    func updateUI() {
        title = "Search"
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        viewModel.repos.bindAndFire {[weak self] (_) in
            self?.tableView.reloadData()
        }
        searchBar.delegate = self
    }
    
    func defaultSearch() {
        let keywork = "awesome ios"
        searchBar.text = keywork
        viewModel.searchRepo(with: keywork)
    }

}

extension SearchRepoViewController: UITableViewDelegate {
    
}

extension SearchRepoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath)
            as? RepoTableViewCell else { return UITableViewCell() }
        cell.configCell(repo: viewModel.repos.value[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let y = scrollView.contentOffset.y
        let content_height = scrollView.contentSize.height
        let frame_height = scrollView.frame.height
        let maximumOffset = content_height - frame_height
        if (maximumOffset - y <= 0) {
            viewModel.searchRepo(with: viewModel.lastKeyword)
        }
    }
}

extension SearchRepoViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText.value = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchRepo(with: viewModel.searchText.value)
    }
}
