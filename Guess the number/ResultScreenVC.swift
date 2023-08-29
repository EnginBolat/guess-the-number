//
//  ResultScreenVC.swift
//  Guess the number
//
//  Created by Engin Bolat on 29.08.2023.
//

import UIKit

class ResultScreenVC: UIViewController {

    
    @IBOutlet weak var imageObject: UIImageView!
    @IBOutlet weak var labelObject: UILabel!
    
    var status:Bool?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sonuç Ekranı"
        self.navigationItem.hidesBackButton = true
       
        if status! {
            labelObject.text = "Kazandınız"
            imageObject.image = UIImage(named: "mutlu_resim")
            
        }else{
            labelObject.text = "Kaybettiniz"
            imageObject.image = UIImage(named: "uzgun_resim")
            
        }
        
    }

    @IBAction func buttonClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
