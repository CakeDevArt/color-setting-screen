//
//  ViewController.swift
//  color setting screen
//
//  Created by Daniel on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorScreenView: UIView!
    
    @IBOutlet weak var nameRedColorLabel: UILabel!
    @IBOutlet weak var nameGreenColorLabel: UILabel!
    @IBOutlet weak var nameBlueColorLabel: UILabel!
    
    @IBOutlet weak var valueRedColorLabel: UILabel!
    @IBOutlet weak var valueGreenColorLabel: UILabel!
    @IBOutlet weak var valueBlueColorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorScreenView.layer.cornerRadius = 10
        
        valueRedColorLabel.text = String(redSlider.value)
        valueGreenColorLabel.text = String(greenSlider.value)
        valueBlueColorLabel.text = String(blueSlider.value)
    }

    @IBAction func redSliderAction() {
    }
    
    @IBAction func greenSliderAction() {
    }
    
    @IBAction func blueSliderAction() {
    }
    
}

