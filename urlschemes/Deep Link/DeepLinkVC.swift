//
//  DeepLinkVC.swift
//  urlschemes
//
//  Created by IRFAN TRIHANDOKO on 12/03/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class DeepLinkVC: UIViewController {
    
    var data: DeepLinkModel!
    var isOpen = false
    var originRoot: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isOpen == true{
            let appdelegate = UIApplication.shared.delegate as? AppDelegate
            appdelegate?.window?.rootViewController = originRoot
            appdelegate?.window?.makeKeyAndVisible()
        }else{
            let vc = UIStoryboard(name: "Details", bundle: nil).instantiateInitialViewController() as! DetailsVC
            vc.data = data
            self.navigationController?.pushViewController(vc, animated: true)
            isOpen = true
        }
    }
}

