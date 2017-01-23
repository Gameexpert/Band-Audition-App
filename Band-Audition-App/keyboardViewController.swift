//
//  keyboardViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 1/12/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
//MARK: Global Variables
var returnedValue: String = "error" //Indicates if unedited
var senderButton: String = "error, variable not overwritten"

class keyboardViewController: UIViewController
{
    //MARK: Properties
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    @IBOutlet weak var butonDone: UIButton!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.data.text = "" //Ensures the textField is clear and doesn't compromise the string.
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

    @IBAction func modifyData(_ sender: UIButton)
    {
        self.data.text = self.data.text! + "\(sender.titleLabel!.text!)" //Adds the title of the button to the textfield.
    }
    
    @IBAction func clearData(_ sender: AnyObject)
    {
        self.data.text = ""
    }
    
    @IBAction func submitData(_ sender: UIButton)
    {
        returnedValue = self.data.text!
        
        //Dismiss the popover programmatically
        self.dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "popoverKeyboardDidFinishEditing"), object: nil)
        
    }
    
}
