//
//  ViewController.swift
//  Textfield
//
//  Created by Thukaram Nandam on 11/7/19.
//  Copyright © 2019 Ram. All rights reserved.
//

import UIKit

    
    class ViewController: UIViewController {
          let textField1: UITextField = UITextField()
        let textFieldPassword: UITextField = UITextField()

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.view.backgroundColor = .gray
            self.createTextField()
        }
        
        func createTextField() {
        
            textField1.frame = CGRect(x: 50, y: 200, width: 230, height: 60)
            textField1.backgroundColor = .white
            textField1.keyboardType = .namePhonePad
            textField1.textAlignment = .center
            textField1.placeholder = "Enter Your Number"
            textField1.delegate = self
            textField1.isSecureTextEntry = true
            self.view.addSubview(textField1)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           // self.isEditing = false
            self.view.endEditing(true)
            self.resignFirstResponder()
        }

    }

    extension ViewController: UITextFieldDelegate {
        func textFieldDidBeginEditing(_ textField: UITextField)  {
            print(textField.text)
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            print(textField.text)
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
             var maxLength = 10
            if textField == textFieldPassword {
                maxLength = 12
            }
           
            let currentString: NSString = textField.text! as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
    }




