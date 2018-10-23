//
//  ViewController.swift
//  Face IDTest
//
//  Created by Minewtech on 2018/10/15.
//  Copyright © 2018 Minewtech. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var typeString : String = ""
        let context = LAContext()
        context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil)
        if #available(iOS 8.0, *) {
            
            
            if #available(iOS 11.2, *){
                if context.biometryType == LABiometryType.touchID {
                    typeString = "指纹识别"
                }
                else if context.biometryType == LABiometryType.faceID {
                    typeString = "Face ID"
                }
                else if context.biometryType == LABiometryType.none {
                    typeString = "nils"
                }
            }
            else
            {
                typeString = "两者都不支持"
            }
        }
        print("type --------> \(typeString)")
        
        context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "ssss") { (success, error) in
            if success {
                print("验证成功。")
            }
            else
            {
                print(error as Any)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}

