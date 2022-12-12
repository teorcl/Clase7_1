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
        static let forward = "Continuar"
        static let documento = "Documento"
        static let suDocumento = "Su documento"
        static let goToStudent = "goToStudent"
        static let goToTeacher = "goToTeacher"
    }
    
    var searchAlert: UIAlertController?
    
    let documentStudents = ["1234","6789","9012"]
    let documentTeachers = ["7123","7456","7000"]
    
    var documentNumber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAlert()
    }
    
    func createAlert(){
        let searchAlert = UIAlertController(title: Const.documento, message: "", preferredStyle: .alert)
        let continueAction = UIAlertAction(title: Const.forward, style: .default) { [weak self] action in
            guard let self else {return}
            if let textFields = searchAlert.textFields{
                self.documentNumber = textFields[0].text!
            }
            self.validateDocument()
        }

        searchAlert.addAction(continueAction)
        searchAlert.addTextField { documentTextField in
            documentTextField.placeholder = Const.suDocumento
            
        }
        self.searchAlert = searchAlert
    }
    
    
    @IBAction func consultButtonPressed() {
        executeSearchAlert()
    }
    
    private func executeSearchAlert(){
        if let searchAlert = searchAlert{
            present(searchAlert, animated: true)
        }
        
    }
    
    private func executeErrorAlert(){
        let errorAlert = UIAlertController(title: Const.error, message: Const.errorMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Const.cancel, style: .cancel)
        errorAlert.addAction(cancelAction)
        present(errorAlert, animated: true)
    }
    
    private func validateDocument(){
        if documentStudents.contains(documentNumber){
            executeTransition(destination: Const.goToStudent)
        }
        
        if documentTeachers.contains(documentNumber){
            executeTransition(destination: Const.goToTeacher)
        }
        
        if !documentStudents.contains(documentNumber) && !documentTeachers.contains(documentNumber) {
            executeErrorAlert()
        }
    }
    
    private func executeTransition(destination: String){
        performSegue(withIdentifier: destination, sender: self)
    }
    
}

