//
//  VPAuditionViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 2/14/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation

class VPAuditionViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, UITextFieldDelegate
{
    //MARK: Properties
    //Outlets for everything in the gui, I'll add names as they are used later.
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var upperLeftStack: UIStackView!
    @IBOutlet weak var upperRightStack: UIStackView!
    @IBOutlet weak var lowerLeftStack: UIStackView!
    @IBOutlet weak var lowerRightStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    
    @IBOutlet weak var upperLeftLabel: UIButton!
    @IBOutlet weak var upperLeftData: UIButton!
    @IBOutlet weak var upperRightLabel: UIButton!
    @IBOutlet weak var upperRightData: UIButton!
    @IBOutlet weak var lowerLeftLabel: UIButton!
    @IBOutlet weak var lowerLeftData: UIButton!
    @IBOutlet weak var lowerRightLabel: UIButton!
    @IBOutlet weak var lowerRightData: UIButton!
    @IBOutlet weak var middleLabel: UIButton!
    @IBOutlet weak var middleData: UIButton!
    //commentsView related objects
    @IBOutlet weak var commentsView: UITextView!
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false
    
    //See setUpDataControl to see it's transformations
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Scale 1","Scale 2","Scale 3","Snare Etude","Mallet Etude","Timpani Etude", "Snare Reading","Mallet Reading"])
    
    //Structure to store data until we save the data.
    struct auditionProperty
    {
        static var first_name: String = ""
        static var last_name: String = ""
        static var instrument: String = ""
        static var comments: String = ""
        
        static var scale1_pitch: Int = 0
        static var scale1_production: Int = 0
        static var scale2_pitch: Int = 0
        static var scale2_production: Int = 0
        static var scale3_pitch: Int = 0
        static var scale3_production: Int = 0
        
        static var snare_rhythm: Int = 0
        static var snare_tempo: Int = 0
        static var snare_dynamic: Int = 0
        static var snare_production: Int = 0
        
        static var mallet_rhythm: Int = 0
        static var mallet_pitch: Int = 0
        static var mallet_tempo: Int = 0
        static var mallet_dynamic: Int = 0
        static var mallet_production: Int = 0
        
        static var timpani_rhythm: Int = 0
        static var timpani_tempo: Int = 0
        static var timpani_dynamic: Int = 0
        static var timpani_production: Int = 0
        
        static var snareRead_rhythm: Int = 0
        static var snareRead_production: Int = 0
        
        static var malletRead_rhythm: Int = 0
        static var malletRead_pitch: Int = 0
        static var malletRead_production: Int = 0
        
        static var finalScore: Int = 0
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.instrumentNameLabel.text! = instrumentType
        //Sets up the data object with known variables
        auditionProperty.instrument = instrumentType
        
        
        //Audition Layout with CGRects
        let frame1 = CGRect(x: 10, y: 121, width: 748, height: 751)
        let dataBorder = UIView(frame: frame1) //Largest Border
        dataBorder.backgroundColor = UIColor.clear
        dataBorder.layer.borderWidth = 1.0
        view.addSubview(dataBorder) //Adds the rectangle to the heirarchy of the view and allows it to be seen
        
        let frame2 = CGRect(x: 10, y: 882, width: 500, height: 128)
        let commentBorder = UIView(frame: frame2) //Border around the text view
        commentBorder.backgroundColor = UIColor.clear
        commentBorder.layer.borderWidth = 1.0
        view.addSubview(commentBorder)
        commentBorder.addSubview(commentsView) //This makes the text field higher on the hierarchy so it's editable
        
        let frame3 = CGRect(x: 519, y: 882, width: 239, height: 128)
        let totalBorder = UIView(frame: frame3) //Border around the text view
        totalBorder.backgroundColor = UIColor.clear
        totalBorder.layer.borderWidth = 1.0
        view.addSubview(totalBorder)
        
        let line1 = CGRect(x: 150, y: 0, width: 1, height: 750)
        let dataLine = UIView(frame: line1)
        dataLine.layer.borderWidth = 1.0
        dataBorder.addSubview(dataLine)
        
        //This next portion is programmatically adding the UISegmentedControl
        let xPosition: CGFloat = -300
        let yPosition: CGFloat = 301
        let elementWidth: CGFloat = 751
        let elementHeight: CGFloat = 150
        dataControl.frame = CGRect(x: xPosition, y: yPosition, width: elementWidth, height: elementHeight)
        dataControl.selectedSegmentIndex = 0
        dataBorder.addSubview(dataControl)
        setUpDataControl(object: dataControl)
        
        //Adding the Data Boxes to the dataBorder so they are interactable
        dataBorder.addSubview(mainStackView)
        
        //Adding the necessary delegates for the view
         self.commentsView.delegate = self
         self.firstNameBox.delegate = self
         self.lastNameBox.delegate = self
        
        //Adds listeners to the NSNotification center for the comments keyboard and the popoverkeyboard to work as intended
        NotificationCenter.default.addObserver(self, selector: #selector(VPAuditionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (VPAuditionViewController.recieveKeyboardData), name: NSNotification.Name(rawValue: "popoverKeyboardDidFinishEditing"), object: nil)
        
        //Creates a listener to the Segmented control object to call selected function when segmented control changes
        dataControl.addTarget(self, action: #selector(VPAuditionViewController.segmentedControlValueChanged), for: .allEvents)
        
        //Calls the segmented control changed method to properly set up the GUI for the selected Index (0)
        segmentedControlValueChanged(segment: dataControl)
        
        loadData()
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
    
    //Following function saves the audition form
    @IBAction func saveData(_ sender: UIButton)
    {
        self.view.endEditing(true)//Dismisses the keyboard, if it exists. This forces a save of the name properties before we actually save any of the data.
        let auditionData: varsityConcertPercussion = varsityConcertPercussion(first_name: auditionProperty.first_name, last_name:  auditionProperty.last_name, instrument: auditionProperty.instrument, comments: auditionProperty.comments, scale1_pitch:  auditionProperty.scale1_pitch, scale1_production:  auditionProperty.scale1_production, scale2_pitch:  auditionProperty.scale2_pitch, scale2_production: auditionProperty.scale2_production, scale3_pitch: auditionProperty.scale3_pitch, scale3_production: auditionProperty.scale3_production, snare_rhythm: auditionProperty.snare_rhythm, snare_tempo: auditionProperty.snare_tempo, snare_dynamic: auditionProperty.snare_dynamic, snare_production: auditionProperty.snare_production, mallet_rhythm: auditionProperty.mallet_rhythm, mallet_pitch: auditionProperty.mallet_pitch, mallet_tempo: auditionProperty.mallet_tempo, mallet_dynamic: auditionProperty.mallet_dynamic, mallet_production: auditionProperty.mallet_production, timpani_rhythm: auditionProperty.timpani_rhythm, timpani_tempo: auditionProperty.timpani_tempo, timpani_dynamic: auditionProperty.timpani_dynamic, timpani_production: auditionProperty.timpani_production, snareRead_rhythm: auditionProperty.snareRead_rhythm, snareRead_production: auditionProperty.snareRead_production, malletRead_rhythm: auditionProperty.malletRead_rhythm, malletRead_pitch: auditionProperty.malletRead_pitch, malletRead_production: auditionProperty.malletRead_production, finalScore: auditionProperty.finalScore)
        varsityAuditions[14].append(auditionData)
        saveVarsityAuditions()
        
        resetAuditionProperty(sender)
    }
    
    //Following Function loads the 2D array object so that it is possible to save the data when the form is filled.
    func loadData()
    {
        Swift.print("HEY! LOOK HERE!")
        loadVarsityAuditions()
        for i in 0..<varsityAuditions.count
        {
            for j in 0..<varsityAuditions[i].count
            {
                print("\(i), \(j), \(varsityAuditions[i][j]), \(varsityAuditions[i][j].first_name), \(varsityAuditions[i][j].last_name)")
            }
            
        }
    }
    
    @IBAction func resetAuditionProperty(_ sender: UIButton)
    {
        let zero: Int = 0
        let blank: String = ""
        
        auditionProperty.first_name = blank
        auditionProperty.last_name = blank
        auditionProperty.instrument = blank
        auditionProperty.comments = blank
        
        auditionProperty.scale1_pitch = zero
        auditionProperty.scale1_production = zero
        auditionProperty.scale2_pitch = zero
        auditionProperty.scale2_production = zero
        auditionProperty.scale3_pitch = zero
        auditionProperty.scale3_production = zero
        
        auditionProperty.snare_rhythm = zero
        auditionProperty.snare_tempo = zero
        auditionProperty.snare_dynamic = zero
        auditionProperty.snare_production = zero
        
        auditionProperty.mallet_rhythm = zero
        auditionProperty.mallet_pitch = zero
        auditionProperty.mallet_tempo = zero
        auditionProperty.mallet_dynamic = zero
        auditionProperty.mallet_production = zero
        
        auditionProperty.timpani_rhythm = zero
        auditionProperty.timpani_tempo = zero
        auditionProperty.timpani_dynamic = zero
        auditionProperty.timpani_production = zero
        
        auditionProperty.snareRead_rhythm = zero
        auditionProperty.snareRead_production = zero
        
        auditionProperty.malletRead_rhythm = zero
        auditionProperty.malletRead_pitch = zero
        auditionProperty.malletRead_production = zero
        
        auditionProperty.finalScore = zero
    }
    
    //Following function rotates the UISegmentedControl 1/2 pi radians
    func setUpDataControl(object: UISegmentedControl)
    {
        #if swift(>=3.1)//The new code with replacement for the decremented stuff.
            object.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2.0))
            //Previous line rotates segmented control 90 degrees.
            
            for view in object.subviews
            {
                for subview in view.subviews
                {
                    subview.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2.0))
                }
            }//This Rotates the text 90 degrees so it is horizontal for the user
        #else //Old decremented code that still needs to work
            object.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2.0))
            //Previous line rotates segmented control 90 degrees.
            for view in object.subviews
            {
                for subview in view.subviews
                {
                    subview.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI / 2.0))
                }
            }//This Rotates the text 90 degrees so it is horizontal for the user
        #endif
    }
    
    //Following method creates the label popover
    @IBAction func giveDescription(_ sender: UIButton)
    {
        desiredLabel = sender.titleLabel!.text!
        
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "labelPopover")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    
    //The next three methods prevent the keyboard from covering the comments box when editing
    func keyboardWillShow(notification:NSNotification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        self.keyboardHeight = Int(keyboardRectangle.height)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -(CGFloat(keyboardHeight)))
        if (!textViewCleared)
        {
            textView.text = ""
            self.textViewCleared = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy:CGFloat(keyboardHeight))
        auditionProperty.comments = textView.text! //Saves the data
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        let itemName: String = textField.restorationIdentifier!
        switch itemName
        {
        case "firstNameBox":
            auditionProperty.first_name = textField.text!
        case "lastNameBox":
            auditionProperty.last_name = textField.text!
        default:
            Swift.print("Error: TextField End Editing Default Called")
        }
    }
    
    func segmentedControlValueChanged(segment: UISegmentedControl)
    {
        let controlIndex: Int = self.dataControl.selectedSegmentIndex
        switch controlIndex
        {
        case 0: //Scale 1
            upperLeftLabel.setTitle("Pitch Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.scale1_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.scale1_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
        case 1: //scale 2
            upperLeftLabel.setTitle("Pitch Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.scale2_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.scale2_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
        case 2: //Scale 3
            upperLeftLabel.setTitle("Pitch Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.scale3_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.scale3_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
        case 3: //Snare Etude
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.snare_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Tempo Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionProperty.snare_tempo)", for: .normal)
            
            lowerLeftLabel.setTitle("Dynamic Accuracy", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.snare_dynamic)", for: .normal)
            
            lowerRightLabel.setTitle("Sound Production", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.snare_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
            middleStack.isHidden = true
        case 4: //Mallet Etude
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.mallet_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Pitch Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionProperty.mallet_pitch)", for: .normal)
            
            lowerLeftLabel.setTitle("Tempo Accuracy", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.mallet_tempo)", for: .normal)
            
            lowerRightLabel.setTitle("Dynamic Accuracy", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.mallet_dynamic)", for: .normal)
            
            middleLabel.setTitle("Sound Production", for: .normal)
            middleData.setTitle("\(auditionProperty.mallet_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
            middleStack.isHidden = false
        case 5: //Timpani Etude
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.timpani_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Tempo Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionProperty.timpani_tempo)", for: .normal)
            
            lowerLeftLabel.setTitle("Dynamic Accuracy", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.timpani_dynamic)", for: .normal)
            
            lowerRightLabel.setTitle("Sound Production", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.timpani_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
            middleStack.isHidden = true
        case 6: //Snare Sight Reading
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.snareRead_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.snareRead_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
            
        case 7: //Mallet Sight Reading
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.malletRead_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Pitch Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionProperty.malletRead_pitch)", for: .normal)
            
            lowerLeftLabel.setTitle("Sound Production", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.malletRead_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
        default:
            Swift.print("segmentedControlValueChanged default case called. controlIndex = \(controlIndex)")
        }
    }
    
    /*
     The following two methods assign values to button labels. It sets things up for the keyboard popover and retrieves data from the popover.
     */
    @IBAction func changeDataValue(_ sender: UIButton)
    {
        //Next line of code stores which button was pressed
        senderButton = sender.restorationIdentifier!
        //Next line of code tells the popover keyboard that we want an Int in a string
        keyboardIsEditingInt = true
        maxInteger = 20
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popoverKeyboard")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    
    func recieveKeyboardData(notification: NSNotification)
    {
        //This function uses global variables (senderButton, returnedValue) found within the keyboardViewController class document. Both are strings
        switch senderButton
        {
        case "upperLeftData":
            upperLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 0: //Scale 1
                auditionProperty.scale1_pitch = Int(returnedValue)!
            case 1: //Scale 2
                auditionProperty.scale2_pitch = Int(returnedValue)!
            case 2: //Scale 3
                auditionProperty.scale3_pitch = Int(returnedValue)!
            case 3: //Snare Etude
                auditionProperty.snare_rhythm = Int(returnedValue)!
            case 4: //Mallet Etude
                auditionProperty.mallet_rhythm = Int(returnedValue)!
            case 5: //Timpani Etude
                auditionProperty.timpani_rhythm = Int(returnedValue)!
            case 6: //Snare Reading
                auditionProperty.snareRead_rhythm = Int(returnedValue)!
            case 7: //Mallet Reading
                auditionProperty.malletRead_rhythm = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperLeftData. index = \(index)")
            }
        case "upperRightData":
            upperRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 0: //Scale 1
                auditionProperty.scale1_production = Int(returnedValue)!
            case 1: //Scale 2
                auditionProperty.scale2_production = Int(returnedValue)!
            case 2: //Scale 3
                auditionProperty.scale3_production = Int(returnedValue)!
            case 3: //Snare Etude
                auditionProperty.snare_tempo = Int(returnedValue)!
            case 4: //Mallet Etude
                auditionProperty.mallet_pitch = Int(returnedValue)!
            case 5: //Timpani Etude
                auditionProperty.timpani_tempo = Int(returnedValue)!
            case 6: //Snare Reading
                auditionProperty.snareRead_production = Int(returnedValue)!
            case 7: //Mallet Reading
                auditionProperty.malletRead_pitch = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperRightData. index = \(index)")
            }
        case "lowerLeftData":
            lowerLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 3: //Snare Etude
                auditionProperty.snare_dynamic = Int(returnedValue)!
            case 4: //Mallet Etude
                auditionProperty.mallet_tempo = Int(returnedValue)!
            case 5: //Timpani Etude
                auditionProperty.timpani_dynamic = Int(returnedValue)!
            case 7: //Mallet Reading
                auditionProperty.malletRead_production = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerLeftData. index = \(index)")
            }
            
        case "lowerRightData":
            lowerRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 3: //Snare Etude
                auditionProperty.snare_production = Int(returnedValue)!
            case 4: //Mallet Etude
                auditionProperty.mallet_dynamic = Int(returnedValue)!
            case 5: //Timpani Etude
                auditionProperty.timpani_production = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerRightData. index = \(index)")
            }
        case "middleData":
            middleData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 4: //Mallet Etude
                auditionProperty.mallet_production = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case middleData. index = \(index)")
            }
        default:
            //Given an error message in console
            Swift.print("Error, default case in recieveKeyboardData was called. senderButton = \(senderButton)")
        }
        //Now it calculates the final score of the item and sets the title of the finalScore label to that.
        calculateFinalScore()
        finalScoreLabel.text! = "Total: \(auditionProperty.finalScore)"
    }
    func calculateFinalScore()
    {
        let score: Int = auditionProperty.scale1_pitch + auditionProperty.scale1_production + auditionProperty.scale2_pitch + auditionProperty.scale2_production + auditionProperty.scale3_pitch + auditionProperty.scale3_production + auditionProperty.snare_rhythm + auditionProperty.snare_tempo + auditionProperty.snare_dynamic + auditionProperty.snare_production + auditionProperty.mallet_rhythm + auditionProperty.mallet_pitch + auditionProperty.mallet_tempo + auditionProperty.mallet_dynamic + auditionProperty.mallet_production + auditionProperty.timpani_rhythm + auditionProperty.timpani_tempo + auditionProperty.timpani_dynamic + auditionProperty.timpani_production + auditionProperty.snareRead_rhythm + auditionProperty.snareRead_production + auditionProperty.malletRead_rhythm + auditionProperty.malletRead_pitch + auditionProperty.malletRead_production
        
        auditionProperty.finalScore = score
    }
 
}
