//
//  GameScreenVC.swift
//  Guess the number
//
//  Created by Engin Bolat on 29.08.2023.
//

import UIKit

class GameScreenVC: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet weak var textfieldObject: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var randomNumber:Int?
    var counter:Int = 5;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int.random(in: 1...100)
        print("Rasgele Sayı : \(randomNumber!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! ResultScreenVC
            gidilecekVC.status = gelenVeri
        }
    }
    
    
    @IBAction func guessButtonClick(_ sender: Any) {
        if let data = textfieldObject.text {
            
            if let guess = Int(data) {
                counter-=1
                if guess == randomNumber! {
                    let sonuc = true
                    performSegue(withIdentifier: "gameToResult", sender: sonuc)
                    return
                }
                
                if guess > randomNumber! {
                    infoLabel.text = "Azalt"
                    statusLabel.text = "Kalan Hak : \(counter)"
                }
               
                if guess < randomNumber! {//Tahmin edilen sayı küçük ise
                    infoLabel.text = "Arttır"
                    statusLabel.text = "Kalan Hak : \(counter)"
                }
                
                if(counter == 0){
                    let sonuc = false
                    performSegue(withIdentifier: "gameToResult", sender: sonuc)
                }
                
                textfieldObject.text = ""
            }
        }
    }
}
