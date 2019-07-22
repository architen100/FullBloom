//
//  ViewController.swift
//  FullBloom2
//
//  Created by Archisha Majee on 7/20/19.
//  Copyright © 2019 Archisha Majee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var ingredientField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        let ingredients = ["gluconlactone": "good chemical exfoliator ",
            "glycolic acid": "good chemical exfoliator",
            "salicylic acid": "good chemical exfoliator",
            "tocopherol": "good vitamin e",
            "tocopherol acetate": "good vitamin e",
            "ceramide 1": "good block water evaporation",
            "ceramide 3": "good block water evaporation",
            "ceramide 9": "good promotes skin lipid",
            "1,4-Dioxane": "bad shown to be toxic",
            "acrylates": "bad shown to be toxic",
            "benzophenone": "bad shown to be toxic",
            "butylated hydroxyanisole" : "bad shown to be toxic",
            "carbon black": "bad shown to be toxic",
            "ethanolamines": "bad shown to be toxic",
            "formaldehyde": "bad shown to be toxic",
            "niacinamide": "good vitamin B skin clearing",
            "capric triglyceride": "good moisture barrier",
            "sodium laurel sulfate": "bad strips moisture",
            "DEA": "bad shown to be toxic",
            "Diethanolamine": "bad shown to be toxic",
            "lanolin": "good moisturizer",
            "phthalates": "bad shown to be toxic",
            "proplyparaben": "bad shown to be toxic",
            "butylparaben": "bad shown to be toxic",
            "dimethicone": "bad silicone blocks moisture",
            "stearic acid": "neutral",
            "sodium tallowate": "neutral",
            "lauric acid": "neutral",
            "sodium isethionate": "neutral"]
        
        var check = ingredientField.text?.split(separator: ",")
        for string in check! {
            print(string)
            for (key,value) in ingredients {
                if (string.contains(key)) {
                    textField.text = key + ": " + value
                    continue
                }
            }
        }
        //textField.text = "Ingredient: \(ingredientField.text!)\n"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ingredientField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}




