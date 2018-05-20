//
//  ViewController.swift
//  Example
//
//  Created by Nestarneal on 2018/05/19.
//  Copyright © 2018年 Nestarneal. All rights reserved.
//

import UIKit
import DatePickerTextField

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var lowerDatePickerTextField: DatePickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowerDatePickerTextField.datePickerTextFieldDelegate = self
    }
}

extension ViewController: DatePickerTextFieldDelegate {
    
    func datePickerTextField(_ datePickerTextField: DatePickerTextField, didSelectDate date: Date) {
        print(date)
    }
}
