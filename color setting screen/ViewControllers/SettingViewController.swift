//
//  ViewController.swift
//  color setting screen
//
//  Created by Daniel on 25.12.2022.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var colorScreenView: UIView! {
        didSet {
            colorScreenView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var valueRedColorLabel: UILabel!
    @IBOutlet weak var valueGreenColorLabel: UILabel!
    @IBOutlet weak var valueBlueColorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    var color: UIColor!
    
    var delegate: SettingViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        addedToolbarForKeyboard()
        navigationItem.hidesBackButton = true
        setupAllValue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func redSliderAction() {
        paintingScreenView()
        valueRedColorLabel.text = String(format: "%.2f", redSlider.value)
        redTF.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        paintingScreenView()
        valueGreenColorLabel.text = String(format: "%.2f", greenSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        paintingScreenView()
        valueBlueColorLabel.text = String(format: "%.2f", blueSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewValue(color: colorScreenView.backgroundColor ?? UIColor.green)
        dismiss(animated: true)
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == redTF {
            let redValueSlider = Float(redTF.text ?? "") ?? 0
            redSlider.value = redValueSlider
            valueRedColorLabel.text = redTF.text
        } else if textField == greenTF {
            let greenValueSlider = Float(greenTF.text ?? "") ?? 0
            greenSlider.value = greenValueSlider
            valueGreenColorLabel.text = greenTF.text
        } else {
            let blueValueSlider = Float(blueTF.text ?? "") ?? 0
            blueSlider.value = blueValueSlider
            valueBlueColorLabel.text = blueTF.text
        }
        
        colorScreenView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    func addedToolbarForKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneEditing))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        redTF.inputAccessoryView = toolbar
        greenTF.inputAccessoryView = toolbar
        blueTF.inputAccessoryView = toolbar
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newLength = currentText.count + string.count - range.length
        return newLength <= 4
      }
    
    
    private func setupValueSliders() {
        
        let ciColor = CIColor(color: color)

        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        redSlider.value = Float(ciColor.red)
        
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.value = Float(ciColor.green)
        
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setupValueLabel() {
        valueRedColorLabel.text = String(format: "%.2f", redSlider.value)
        valueGreenColorLabel.text = String(format: "%.2f", greenSlider.value)
        valueBlueColorLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupValueTextField() {
        redTF.text = String(format: "%.2f", redSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func paintingScreenView() {
        
        colorScreenView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    private func setupAllValue() {
        setupValueSliders()
        setupValueLabel()
        setupValueTextField()
        paintingScreenView()
    }
    
    @objc private func doneEditing() {
            view.endEditing(true)
    }
}

