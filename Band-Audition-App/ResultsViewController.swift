//
//  ResultsViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 12/7/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController
{
    //MARK Properties
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    
    override func viewWillAppear(_ animated: Bool) //This function changes which tab is displayed based on the button selected in the entry view controller
    {
        tabBarController?.selectedIndex = tabBarIndex
    }
    
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
    
    //MARK Functions
    @IBAction func segueNext(_ sender: UISwipeGestureRecognizer)
    {
        if((tabBarController?.selectedIndex)! < 3)
        {
            tabBarController?.selectedIndex = tabBarIndex + 1
            tabBarIndex += 1
        }
    }
    
    @IBAction func segueToResultsList(_ sender: UIButton)
    {
        let newVCName = "resultsList"
        //If else case lets resultsListViewController know what data to pull.
        if sender.titleLabel?.text! == "Varsity Concert"
        {
            arrayIdentifier = 0
        }
        else if sender.titleLabel?.text! == "Freshmen Concert"
        {
            arrayIdentifier = 1
        }
        else //Jazz Concert
        {
            arrayIdentifier = 2
        }
        
        //Loads all the data before segue into results list so that the data is actually there to view.
        loadVarsityAuditions()
        loadFreshmenAuditions()
        loadJazzAuditions()
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
        present(viewController!, animated: true, completion: nil)
    }
    
    @IBAction func recieveResultsUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        //No code should go here.
    }
}

