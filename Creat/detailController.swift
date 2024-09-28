//
//  detailController.swift
//  Creat
//
//  Created by Yusıf Aqakerımov on 24.09.24.
//

import UIKit

class detailController: UIViewController{
    var selectedcity: City?
    @IBOutlet weak var detaillabel: UILabel!
    @IBOutlet weak var detailimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        if let city = selectedcity {
            detaillabel.text = city.cityText?.rawValue
            detailimage.image = UIImage(named: city.cityImage ?? "") 
        }
        
        
        
    }
}

       
    
