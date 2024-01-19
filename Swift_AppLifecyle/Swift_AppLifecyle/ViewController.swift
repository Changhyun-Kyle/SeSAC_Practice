//
//  ViewController.swift
//  Swift_AppLifecyle
//
//  Created by 강창현 on 1/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let welcomeViewController = storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.identifier)
        else {
            return
        }
        present(welcomeViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        guard
//            let welcomeViewController = storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.identifier)
//        else {
//            return
//        }
//        present(welcomeViewController, animated: true)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
//        guard
//            let welcomeViewController = storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.identifier)
//        else {
//            return
//        }
//        present(welcomeViewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        guard
//            let welcomeViewController = storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.identifier)
//        else {
//            return
//        }
//        present(welcomeViewController, animated: true)
    }
    
}

