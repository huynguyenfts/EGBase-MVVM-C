//
//  FollowRepoViewModel.swift
//  EGBase-MVVM-C
//
//  Created by nguyen.duc.huy on 9/10/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import Foundation
import XCoordinator

class FollowRepoViewModel {
    
    // MARK: - Variable
    
    private let router: AnyRouter<FollowRepoRoute>
    
    // MARK: - Init
    
    init(router: AnyRouter<FollowRepoRoute>) {
        self.router = router
    }
    
    // MARK: - Navigator
    
    
    // MARK: - Logic
    
    func pushToOther() {
        let viewModel = OtherViewModel(router: self.router.anyRouter)
        viewModel.showSomething = { content in
            print(">>>>>> " + (content ?? ""))
        }
        self.router.trigger(.other(viewModel))
    }
}

