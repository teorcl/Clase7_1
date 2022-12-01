//
//  WelcomeViewController.swift
//  Clase7_1
//
//  Created by TEO on 30/11/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private struct Const {
        static let error = "Error"
        static let errorMessage = "No existe el documento"
        static let cancel = "Cancelar"
    }

    
    @IBAction func consultButtonPressed() {
        // Disparar alerta
        executeErrorAlert()
    }
    
    private func executeErrorAlert(){
        let errorAlert = UIAlertController(title: Const.error, message: Const.errorMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Const.cancel, style: .cancel)
        errorAlert.addAction(cancelAction)
        present(errorAlert, animated: true)
    }
    
}

