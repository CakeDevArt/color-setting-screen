//
//  ColorViewController.swift
//  color setting screen
//
//  Created by Daniel on 07.02.2023.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValue(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class ColorViewController: UIViewController {
    
    var redColor: CGFloat = 0.85
    var greenColor: CGFloat = 0.45
    var blueColor: CGFloat = 0.37
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.colorViewRed = redColor
        settingVC.colorViewGreen = greenColor
        settingVC.colorViewBlue = blueColor
        
        settingVC.delegate = self
    }
}

// MARK: - SettingViewControllerDelegate

extension ColorViewController: SettingViewControllerDelegate {
    func setNewValue(red: CGFloat, green: CGFloat, blue: CGFloat) {
        redColor = red
        greenColor = green
        blueColor = blue
        
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
    
    
    
}
