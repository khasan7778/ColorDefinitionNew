//
//  SettingViewController.swift
//  ColorDefinitionNew
//
//  Created by Хасан Балхаев on 25.12.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var colorDefinitionMini: UIView!
    
    @IBOutlet weak var meaningRedSlider: UILabel!
    @IBOutlet weak var meaningGreenSlider: UILabel!
    @IBOutlet weak var meaningBlueSlider: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorDefinitionMini.layer.cornerRadius = 20
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
                
        meaningRedSlider.text = String(redSlider.value)
        meaningGreenSlider.text = String(greenSlider.value)
        meaningBlueSlider.text = String(blueSlider.value)
        
        changeColor()

    }
    
    func changeColor () {
        colorDefinitionMini.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    
    @IBAction func rgbSlider() {
        meaningRedSlider.text = String(round(redSlider.value * 100) / 100)
        meaningGreenSlider.text = String(round(greenSlider.value * 100) / 100)
        meaningBlueSlider.text = String(round(blueSlider.value * 100) / 100)
        
        changeColor()
    }
    
   
}
