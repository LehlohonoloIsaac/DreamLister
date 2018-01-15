//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by dvt on 2018/01/12.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    var stores: [Store] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        storePicker.dataSource = self
        storePicker.delegate = self
        
//        let store = Store(context: context!)
//        store.name = "Best Buy"
//        let store2 = Store(context: context!)
//        store2.name = "Tesla dealership"
//        let store3 = Store(context: context!)
//        store3.name = "Hlox electronics"
//        let store4 = Store(context: context!)
//        store4.name = "Amazon"
//        let store5 = Store(context: context!)
//        store5.name = "K Mart"
//        appD?.saveContext()
        
        getStores()
    }

    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = (try context?.fetch(fetchRequest))!
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
    
        let item = Item(context: context!)
        
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text {
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        appD?.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension ItemDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
}
