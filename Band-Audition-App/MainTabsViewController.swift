//
//  MainTabsViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 4/13/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation

class MainTabsViewController: UIViewController
{
    //MARK Properties
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var varsityConcertButton: UIButton!
    @IBOutlet weak var freshmenConcertButton: UIButton!
    @IBOutlet weak var jazzBandButton: UIButton!
    var category: String = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK Functions
    @IBAction func segueToTabBarController(_ sender: UIButton)
    {
        category = sender.titleLabel!.text!
        
        switch category
        {
        case "Results":
            tabBarIndex = 0
        case "Varsity Concert":
            tabBarIndex = 1
        case "Freshmen Concert":
            tabBarIndex = 2
        case "Jazz Band":
            tabBarIndex = 3
        default:
            Swift.print("Error: segueToTabBarController Default Called")
        }
        
        let newVCName = "tabBar"
        let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
        present(viewController!, animated: true, completion: nil)
    }
}
