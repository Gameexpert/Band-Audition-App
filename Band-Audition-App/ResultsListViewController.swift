//
//  ResultsListViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 4/4/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

class ResultsListViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Functions
    @IBAction func sortControlChanged(_ sender: UISegmentedControl)
    {
        
    }
}
