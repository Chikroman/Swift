//
//  ViewController.swift
//  les2_2
//
//  Created by Роман Чикишев on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtom:
        UIButton!

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        let recongizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recongizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recongizer)
    }
    
    @objc func keyboardDidShow(_ notificatoin: Notification) {
        guard let keyboardHeight = ((notificatoin.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue)?.height else { return}
        let insert = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = insert
        scrollView.scrollIndicatorInsets = insert
    }

    @objc func keyboardDidHide(_ notificatoin: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    @objc func onTap() {
        self.view.endEditing(true)
        
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return}
        if login == "admin", password == "qwerty"{
            print("good")
        }else {
            print("bad")}
        
    }
}

