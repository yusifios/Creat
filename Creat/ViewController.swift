//
//  ViewController.swift
//  Creat
//
//  Created by Yusıf Aqakerımov on 05.09.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usertext: UITextField!
    @IBOutlet weak var phonetext: UITextField!
    @IBOutlet weak var mailtext: UITextField!
    @IBOutlet weak var userror: UILabel!
    @IBOutlet weak var paserror: UILabel!
    @IBOutlet weak var passtext: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mailerror: UILabel!
    @IBOutlet weak var numerror: UILabel!
   
    var registerclicked: ((data)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usertext.delegate = self
        usertext.layer.borderWidth = 2
        usertext.layer.borderColor=UIColor.clear.cgColor
        passtext.delegate = self
        passtext.layer.borderWidth = 2
        passtext.layer.borderColor=UIColor.clear.cgColor
        userror.isHidden = true
        mailtext.delegate=self
        mailtext.layer.borderWidth = 2
        mailtext.layer.borderColor=UIColor.clear.cgColor
        phonetext.delegate=self
        phonetext.layer.borderWidth = 2
        phonetext.layer.borderColor=UIColor.clear.cgColor
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        guard let username=usertext.text else {return}
        if username.count < 4{
            userror.isHidden = false
        }
       
        guard let pass = passtext.text else { return }
        if pass.count < 8{
            paserror.isHidden = false
        }
        
        guard let email=mailtext.text else {return}
        if !isValidEmail(email: email) {
            mailerror.isHidden = false
            
        }
        
        guard let phone=phonetext.text else {return}
        if !isValidPhoneNumber(phoneNumber: phone) {
            numerror.isHidden = false
            
        }
        
        
        if userror.isHidden  && paserror.isHidden  && mailerror.isHidden && numerror.isHidden {
            let newuser = data (username: username, password: pass, email: email, number: phone)
            registerclicked?(newuser)
            usertext.text = ""
            passtext.text = ""
            mailtext.text = ""
            phonetext.text = ""
            print(newuser)
        }
    }
}

func isValidEmail(email: String)-> Bool{
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
return emailPred.evaluate(with: email)
}

func isValidPhoneNumber( phoneNumber: String) -> Bool {
    let pattern = "^(050|051|055)\\d{7}$"
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
        return false
    }
    let range = NSRange(location: 0, length: phoneNumber.utf16.count)
    let matches = regex.matches(in: phoneNumber, options: [], range: range)
    return !matches.isEmpty
}


extension ViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        usertext.layer.borderColor = UIColor.clear.cgColor
        passtext.layer.borderColor = UIColor.clear.cgColor
        mailtext.layer.borderColor = UIColor.clear.cgColor
        phonetext.layer.borderColor = UIColor.clear.cgColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text=usertext.text else{return}
        guard let pass=passtext.text else{return}
      
        switch textField {
        case usertext:
            if text.isEmpty || text.count<4 {
                usertext.layer.borderColor = UIColor.red.cgColor
            }
            
            else{
                usertext.layer.borderColor = UIColor.green.cgColor
                userror.isHidden = true
            }
            
        case passtext:
            if pass.isEmpty || pass.count<8 {
                passtext.layer.borderColor = UIColor.red.cgColor
            }
            
            else{
                passtext.layer.borderColor = UIColor.green.cgColor
                paserror.isHidden = true
            }
            
        case mailtext:
            if let email = mailtext.text{
                    if !isValidEmail(email: email) {
                        mailtext.layer.borderColor = UIColor.red.cgColor
                    } else {
                        mailerror.isHidden = true
                        mailtext.layer.borderColor = UIColor.green.cgColor
                    }
                    
                }
            
        case phonetext:
            if let phone = phonetext.text{
                if !isValidPhoneNumber(phoneNumber: phone) {
                    phonetext.layer.borderColor = UIColor.red.cgColor
                } else {
                   numerror.isHidden = true
                    phonetext.layer.borderColor = UIColor.green.cgColor
                }
                
            }
            
        default: break
        }
        
    }
}
    
    
    
    
    
   

