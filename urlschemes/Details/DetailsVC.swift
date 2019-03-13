//
//  DetailsVC.swift
//  urlschemes
//
//  Created by IRFAN TRIHANDOKO on 12/03/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var descLbl: UILabel!
    var data: DeepLinkModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.descLbl.text = "TYPE: \(self.data?.type ?? "")\nID: \(self.data?.id ?? "")\nCATEGORY ID: \(self.data?.categoryId ?? "")"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
