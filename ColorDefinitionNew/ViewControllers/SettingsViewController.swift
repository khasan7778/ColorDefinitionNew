//
//  SettingViewController.swift
//  ColorDefinitionNew
//
//  Created by Хасан Балхаев on 25.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
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
    
    var background: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorDefinitionMini.backgroundColor = background
        colorDefinitionMini.layer.cornerRadius = 20
        
        let colorSplitting = CIColor(color: background ?? .black)
        redSlider.value = Float(colorSplitting.red)
        greenSlider.value = Float(colorSplitting.green)
        blueSlider.value = Float(colorSplitting.blue)
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        rgbSlider()
    }
    
    @IBAction func rgbSlider() {
        meaningRedSlider.text = String(round(redSlider.value * 100) / 100)
        meaningGreenSlider.text = String(round(greenSlider.value * 100) / 100)
        meaningBlueSlider.text = String(round(blueSlider.value * 100) / 100)
        
        redTF.text = String(round(redSlider.value * 100) / 100)
        greenTF.text = String(round(greenSlider.value * 100) / 100)
        blueTF.text = String(round(blueSlider.value * 100) / 100)
        
        changeColor()
    }
    
    @IBAction func done() {
        delegate.changeColorVC(for: colorDefinitionMini.backgroundColor ?? UIColor.black)
        dismiss(animated: true)
    }
    private func changeColor () {
        colorDefinitionMini.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}


extension SettingsViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK",
                                     style: .default)
        alert.addAction(OKAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        
        if textField == redTF {
            redSlider.value = Float(newValue) ?? 0
            rgbSlider()
            if redSlider.value != Float(newValue) {
                redTF.text = " "
                showAlert(title: "ERROR!!!", message: "Enter a value between 0 and 1")
            }
        } else if textField == greenTF {
            greenSlider.value = Float(newValue) ?? 0
            rgbSlider()
            if greenSlider.value != Float(newValue) {
                greenTF.text = " "
                showAlert(title: "ERROR!!!", message: "Enter a value between 0 and 1")
            }
        } else if textField == blueTF {
            blueSlider.value = Float(newValue) ?? 0
            rgbSlider()
            if blueSlider.value != Float(newValue) {
                blueTF.text = " "
                showAlert(title: "ERROR!!!", message: "Enter a value between 0 and 1")
            }
        }
    }
}
