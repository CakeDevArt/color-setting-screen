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
        colorScreenView.layer.cornerRadius = 15
        paintingScreenView()
        setupValueLabel()
    }
    
    @IBAction func redSliderAction() {
        valueRedColorLabel.text = String(round(redSlider.value * 100) / 100)
        paintingScreenView()
    }
    
    @IBAction func greenSliderAction() {
        valueGreenColorLabel.text = String(round(greenSlider.value * 100) / 100)
        paintingScreenView()
    }
    
    @IBAction func blueSliderAction() {
        valueBlueColorLabel.text = String(round(blueSlider.value * 100) / 100)
        paintingScreenView()
    }
    
    private func setupValueLabel() {
        nameRedColorLabel.text = "Red:"
        nameGreenColorLabel.text = "Green:"
        nameBlueColorLabel.text = "Blue:"
        
        valueRedColorLabel.text = String(redSlider.value)
        valueGreenColorLabel.text = String(greenSlider.value)
        valueBlueColorLabel.text = String(blueSlider.value)
    }
    
    private func paintingScreenView() {
        colorScreenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
}
