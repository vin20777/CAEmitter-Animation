//
//  ViewController.swift
//  FourSeason
//
//  Created by VTStudio on 2017/9/12.
//  Copyright © 2017年 VTStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! EmitterViewController
        destination.season = segue.identifier
    }
}

