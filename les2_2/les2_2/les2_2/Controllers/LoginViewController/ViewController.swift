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
    
    @IBOutlet weak var firstRedView: UIView!
    @IBOutlet weak var secondRedView: UIView!
    @IBOutlet weak var thirdRedView: UIView!
    
    func animateDownLoadsView(exitAfter: Int , currentAfter: Int = 0) {
        UIView.animate(withDuration: 3) {[weak self] in
            self?.firstRedView.alpha = 0
            self?.secondRedView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 3) {[weak self] in
                self?.secondRedView.alpha = 0
                self?.thirdRedView.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 3) {[weak self] in
                    self?.thirdRedView.alpha = 0
                    self?.firstRedView.alpha = 1
                } completion: { [weak self] _ in
                    if exitAfter > currentAfter {
                        self?.animateDownLoadsView(exitAfter: exitAfter, currentAfter: currentAfter+1)
                    }
                    else {
                        return
                    }
                }
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillFriendsData()
        fillGroupData()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        let recongizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recongizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recongizer)
        self.secondRedView.alpha = 0
        self.thirdRedView.alpha = 0
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
        animateDownLoadsView(exitAfter: 200)
        guard let login = loginTextField.text, let password = passwordTextField.text else { return}
//        if login == "admin", password == "qwerty"{
//            print("good")
            performSegue(withIdentifier: "fromLoginTabbar", sender: nil)
//        }else {
//            print("bad")}
        
    }
    func fillFriendsData() {
        let friends1 = Friend(name: "Des", avatar: "Des1", fotos: ["Des1","Des2"])
        let friends2 = Friend(name: "Sidor", avatar: "Sidor1", fotos: ["Sidor1","Sidor2"])
        Storage.share.myFriends.append(friends1)
        Storage.share.myFriends.append(friends2)
    }
    func fillGroupData() {
        let groups1 = Group(name: "Клуб любителей пива", avatar: "beer1", description: "Любители пива")
        let groups2 = Group(name: "Клуб любителей шашлыка", avatar: "shashlik1", description: "Любители шашлыка")
        Storage.share.allGroups.append(groups1)
        Storage.share.allGroups.append(groups2)
    }
}

