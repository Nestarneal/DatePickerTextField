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
    
    private lazy let toolBar = {
        let toolBar = UIToolbar()
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonItemPressed(sender:)))
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonItemPressed(sender:)))
        let flexibleBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [cancelBarButtonItem, flexibleBarButtonItem, doneBarButtonItem]
        return toolBar
    }()

    private let datePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.setDate(Date(), animated: true)
        return datePicker
    }()
    
    private let dateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dataFormatter
    }()

    private var previousSelectedDate = Date()
    
    @IBOutlet public weak var datePickerTextFieldDelegate: DatePickerTextFieldDelegate?
    
    // MARK: Public Methods
    
    public func set(date: Date) {
        previousSelectedDate = date
        text = dateFormatter.string(from: date)
        datePicker.setDate(date, animated: true)

        // Inform the set date to delegate.
        datePickerTextFieldDelegate?.datePickerTextField(self, didSelectDate: date)
    }
    
    public func get() -> Date {
        return previousSelectedDate
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
        inputView = datePicker
        
        // Set tool bar.
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
                
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
