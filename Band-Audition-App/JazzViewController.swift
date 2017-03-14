//
//  JazzViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 12/7/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import UIKit

class JazzViewController: UIViewController
{
    //MARK Properties
    
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!

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
    @IBAction func seguePrevious(_ sender: UISwipeGestureRecognizer)
    {
        if((tabBarController?.selectedIndex)! > 0)
        {
            tabBarController?.selectedIndex -= 1
        }
    }
    
    
    @IBAction func segueToJRAudition(_ sender: UIButton)
    {
        instrumentType = sender.titleLabel!.text!
        //Following three lines "presents" the JRAuditionViewController programatically.
        let newVCName = "JRAudition"
        let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
        present(viewController!, animated: true, completion: nil)
    }
    @IBAction func segueToJDAudition(_ sender: UIButton)
    {
        instrumentType = sender.titleLabel!.text!
        //Following three lines "presents" the JDAuditionViewController programatically.
        let newVCName = "JDAudition"
        let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
        present(viewController!, animated: true, completion: nil)
    }
    
    @IBAction func recieveJDUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        //No code should go here.
    }
    
    @IBAction func recieveJRUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        //No code should go here.
    }

}
