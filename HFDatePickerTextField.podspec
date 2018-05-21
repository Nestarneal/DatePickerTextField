Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.name         = "HFDatePickerTextField"
  s.version      = "1.1.0"
  s.summary      = "A simple wrapper for UITextField that can pick date."

  s.description  = "HFDatePickerTextField wrap the UITextField by replace its inputView and inputAccessory
      with a UIDatePicker and a UIToolbar. HFDatePickerTextField also remember what's selected."

  s.homepage     = "https://github.com/Nestarneal/DatePickerTextField"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.author             = { "Nestarneal" => "nestarneal@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.platform     = :ios, "9.3"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.source       = { :git => "https://github.com/Nestarneal/DatePickerTextField.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.source_files  = "DatePickerTextField", "DatePickerTextField/**/*.{h,m,swift}"
  
  s.swift_version = '4.0'
end
