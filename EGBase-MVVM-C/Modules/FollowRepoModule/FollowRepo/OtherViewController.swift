//
//  OtherViewController.swift
//  EGBase-MVVM-C
//
//  Created by Văn Tiến Tú on 4/20/20.
//  Copyright © 2020 8Group. All rights reserved.
//

import UIKit

class OtherViewController: BaseViewController, BindableType {

    typealias ViewModelType = OtherViewModel
    
    var viewModel: OtherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        
    }
    
    @IBAction func popAction(_ sender: Any) {
        self.viewModel.backToPrevious()
    }
}
