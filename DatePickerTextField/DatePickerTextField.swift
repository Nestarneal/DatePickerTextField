//
//  DatePickerTextField.swift
//  DatePickerTextField
//
//  Created by Nestarneal on 2018/05/19.
//  Copyright © 2018年 Nestarneal. All rights reserved.
//

import UIKit

@objc public protocol DatePickerTextFieldDelegate: class {
    
    func datePickerTextField(_ datePickerTextField: DatePickerTextField, didSelectDate date: Date)
}

public class DatePickerTextField: UITextField {

    // MARK: - Properties
    
    private let toolBar = UIToolbar()
    private let datePicker = UIDatePicker()
    
    private var previousSelectedDate = Date()
    
    private let dateFormatter = DateFormatter()
    
    @IBOutlet public weak var datePickerTextFieldDelegate: DatePickerTextFieldDelegate?
    
    // MARK: Public Methods
    
    public func set(date: Date) {
        previousSelectedDate = date
        text = dateFormatter.string(from: date)
        datePicker.setDate(date, animated: true)
        datePickerTextFieldDelegate?.datePickerTextField(self, didSelectDate: date)
    }
    
    // MARK: - Actions
    
    @objc private func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        resignFirstResponder()
        previousSelectedDate = datePicker.date
        text = dateFormatter.string(from: previousSelectedDate)
        
        // Inform the selected date to delegate.
        datePickerTextFieldDelegate?.datePickerTextField(self, didSelectDate: previousSelectedDate)
    }
    
    @objc private func cancelBarButtonItemPressed(sender: UIBarButtonItem) {
        resignFirstResponder()
    }
    
    // MARK: - Initialization
    
    private func setUp() {
        
        // Set date picker.
        datePicker.datePickerMode = .date
        datePicker.setDate(previousSelectedDate, animated: true)
        inputView = datePicker
        
        // Set tool bar.
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonItemPressed(sender:)))
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonItemPressed(sender:)))
        let flexibleBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [cancelBarButtonItem, flexibleBarButtonItem, doneBarButtonItem]
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
        
        // Set the presentation format of date.
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        // Set default text.
        text = dateFormatter.string(from: previousSelectedDate)
        
        // Set delegate.
        delegate = self
        
        // Set tint color to make the cursor disappeared.
        tintColor = .clear
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
}

extension DatePickerTextField: UITextFieldDelegate {
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        datePicker.setDate(previousSelectedDate, animated: true)
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
