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
var keyboardIsEditingInt: Bool = true //True = int, false = double
var maxInteger: Int = 20 //Should be either 20 or 50

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
        
        if keyboardIsEditingInt
        {
            buttonDecimal.isEnabled = false //Disables the button from being pressed
        }
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
        if keyboardIsEditingInt == true //Sets limits on int ranges
        {
            self.data.text = self.data.text! + "\(sender.titleLabel!.text!)" //Adds the title of the button to the textfield.
            let input: Int = Int(self.data.text!)!
            if input > maxInteger //Dynamic max to fit multiple forms.
            {
                self.data.text! = "\(maxInteger)"
            }
            else if input < 0
            {
                self.data.text! = "0" //should never be called.
            }
        }
        else //Sets limits on double ranges
        {
            /*Makes a check for multiple periods, which ceases to be a number
             If-Statement reads: if the button pressed was a decimal AND there are no decimals (to prevent multiple decimals) OR the button pressed was not a decimal.
             */
            let decimal: Character = "."
            if (sender.titleLabel!.text! == "." && !(self.data.text!.characters.contains(decimal))) || (sender.titleLabel!.text! != ".")
            {
                if (self.data.text == "" && sender.titleLabel!.text == ".")//If the decimal is the first button pressed
                {
                    self.data.text = "0."
                }
                else
                {
                self.data.text = self.data.text! + "\(sender.titleLabel!.text!)" //Adds the title of the button to the textfield.
                }
                let input: Double = Double(self.data.text!)!
                if input > 5.0
                {
                    self.data.text! = "5.0"
                }
                else if input < 0.0
                {
                    self.data.text! = "0.0"
                }
            }
        }
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
