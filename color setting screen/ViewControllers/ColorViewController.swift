//
//  ColorViewController.swift
//  color setting screen
//
//  Created by Daniel on 07.02.2023.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValue(color: UIColor)
}

class ColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = view.backgroundColor
        
        settingVC.delegate = self
    }
}

// MARK: - SettingViewControllerDelegate

extension ColorViewController: SettingViewControllerDelegate {
    func setNewValue(color: UIColor) {
        view.backgroundColor = color
    }
    
    
    
    
    
}
