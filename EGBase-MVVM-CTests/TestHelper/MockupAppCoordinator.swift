//
//  MockupAppCoordinator.swift
//  EGBase-MVVM-CTests
//
//  Created by nguyen.duc.huy on 9/18/19.
//  Copyright © 2019 8Group. All rights reserved.
//

import UIKit
import XCoordinator
@testable import EGBase_MVVM_C


class MockupAppCoordinator: AppCoordinator {
    var currentRoute: AppRoute?

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        currentRoute = route
        return super.prepareTransition(for: route)
    }
    
}
