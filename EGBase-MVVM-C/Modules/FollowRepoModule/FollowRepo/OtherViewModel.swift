//
//  OtherViewModel.swift
//  EGBase-MVVM-C
//
//  Created by Văn Tiến Tú on 4/20/20.
//  Copyright © 2020 8Group. All rights reserved.
//

import UIKit
import XCoordinator

class OtherViewModel: NSObject {
    // MARK: - Variable
    
    private let router: AnyRouter<FollowRepoRoute>
    
    // MARK: - Init
    
    init(router: AnyRouter<FollowRepoRoute>) {
        self.router = router
    }
    
    var showSomething: ((String?) -> ())?
    
    func backToPrevious() {
        self.showSomething?("Do something else")
        self.router.trigger(.dismiss)
    }
}
