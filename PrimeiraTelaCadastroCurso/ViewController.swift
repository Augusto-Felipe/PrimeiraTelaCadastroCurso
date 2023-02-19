//
//  ViewController.swift
//  PrimeiraTelaCadastroCurso
//
//  Created by Felipe Augusto Correia on 18/02/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardConfig()
        textFieldDelegates()
        
        registerButton.isEnabled = false
        
    }
    
    func createAlert(titulo: String, mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        alert.addAction(button)
        present(alert, animated: true)
    }
    
    func validateTextField() -> Bool {
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            registerButton.isEnabled = true
            return true
        } else {
            registerButton.isEnabled = false
            return false
        }
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        if validateTextField() {
            createAlert(titulo: "Sucesso", mensagem: "Usuário registrado com sucesso!!!")
        }
    }
    
    func keyboardConfig() {
       
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
    }
    
    func textFieldDelegates() {
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        _ = validateTextField()
        textField.layer.borderWidth = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

