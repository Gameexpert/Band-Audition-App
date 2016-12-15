//
//  FPAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 12/14/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import UIKit

class FPAuditionViewController: UIViewController
{
    //MARK Properties
    @IBOutlet weak var backButton: UIButton!
    

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK Actions
    @IBAction func backToTab(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "FPToTab", sender: self)
    }
    

}
