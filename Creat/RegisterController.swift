//
//  RegisterController.swift
//  Creat
//
//  Created by Yusıf Aqakerımov on 18.09.24.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var username1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    @IBOutlet weak var registr: UIButton!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func login(_sender: Any){
        let mainController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "CountryController") as? CountryController ?? CountryController()
        self.navigationController?.pushViewController(mainController, animated: true)
    }
    @IBAction func registr(_sender: Any){
        let mainController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ViewController") as? ViewController ?? ViewController()
        self.navigationController?.pushViewController(mainController, animated: true)
        mainController.registerclicked = {[weak self] data in
            self?.username1.text = data.username
            self?.password2.text = data.password
        }
    }
}



