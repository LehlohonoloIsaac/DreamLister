//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by dvt on 2018/01/12.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }

}
