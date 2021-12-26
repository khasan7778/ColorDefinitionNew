//
//  ViewController.swift
//  ColorDefinitionNew
//
//  Created by Хасан Балхаев on 25.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func changeColorVC(for backgroundColor: UIColor)
}

class StartViewController: UIViewController {

    @IBOutlet weak var colorDefinitionMaxi: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.background = colorDefinitionMaxi.backgroundColor
        settingsVC.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func changeColorVC(for backgroundColor: UIColor) {
        colorDefinitionMaxi.backgroundColor = backgroundColor
    }
}
