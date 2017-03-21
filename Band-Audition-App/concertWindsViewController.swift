//
//  concertWindsViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 3/6/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation

//MARK: Global Variables relevant to this viewController
var category: String = "Error"

class concertWindsViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, UITextFieldDelegate
{
    //MARK: Properties
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var memorizedSwitch: UISwitch!
    
    @IBOutlet weak var upperLeftLabel: UIButton!
    @IBOutlet weak var upperLeftData: UIButton!

    @IBOutlet weak var upperRightLabel: UIButton!
    @IBOutlet weak var upperRightData: UIButton!
    
    @IBOutlet weak var middleLeftLabel: UIButton!
    @IBOutlet weak var middleLeftData: UIButton!
    
    @IBOutlet weak var middleRightLabel: UIButton!
    @IBOutlet weak var middleRightData: UIButton!
    
    @IBOutlet weak var lowerLeftLabel: UIButton!
    @IBOutlet weak var lowerLeftData: UIButton!
    
    @IBOutlet weak var lowerRightLabel: UIButton!
    @IBOutlet weak var lowerRightData: UIButton!
    
    @IBOutlet weak var upperLeftStack: UIStackView!
    @IBOutlet weak var upperRightStack: UIStackView!
    @IBOutlet weak var middleLeftStack: UIStackView!
    @IBOutlet weak var middleRightStack: UIStackView!
    @IBOutlet weak var lowerLeftStack: UIStackView!
    @IBOutlet weak var lowerRightStack: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!

    //commentsView related objects
    @IBOutlet weak var commentsView: UITextView!
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false
    
    //See setUpDataControl to see it's transformations
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Knowledge\n&\nPerformance", "Etude 1", "Etude 2", "Sight Read"])
    
    //Structure to store data until we save the data
    struct auditionProperty
    {
        static var first_name: String = ""
        static var last_name: String = ""
        static var instrument: String = ""
        static var concert_type: String = "" //Either "Varsity" or "Freshmen"
        static var comments: String = ""
        static var memorized: Bool = false
        
        static var scale1: Double = 0
        static var scale2: Double = 0
        static var scale3: Double = 0
        static var scale4: Double = 0
        static var scale5: Double = 0
        static var chromatic_scale: Double = 0
        
        static var etude1_pitch: Double = 0
        static var etude1_rhythm: Double = 0
        static var etude1_articulation: Double = 0
        static var etude1_dynamics: Double = 0
        static var etude1_tone: Double = 0
        static var etude1_style: Double = 0
        
        static var etude2_pitch: Double = 0
        static var etude2_rhythm: Double = 0
        static var etude2_articulation: Double = 0
        static var etude2_dynamics: Double = 0
        static var etude2_tone: Double = 0
        static var etude2_style: Double = 0
        
        static var read_pitch: Double = 0
        static var read_rhythm: Double = 0
        
        static var finalScore: Double = 0
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Sets up the data object with known variables
        self.instrumentNameLabel.text! = instrumentType
        auditionProperty.instrument = instrumentType
        auditionProperty.concert_type = category
        categoryLabel.text = "\(auditionProperty.concert_type) Winds"
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(concertWindsViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (concertWindsViewController.recieveKeyboardData), name: NSNotification.Name(rawValue: "popoverKeyboardDidFinishEditing"), object: nil)
        
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

    //Following function saves the audition form
    @IBAction func saveData(_ sender: UIButton)
    {
        self.view.endEditing(true)//Dismisses the keyboard, if it exists. This forces a save of the name properties before we actually save any of the data.
        let auditionData: concertWinds = concertWinds(first_name: auditionProperty.first_name, last_name: auditionProperty.last_name, instrument: auditionProperty.instrument, concert_type: auditionProperty.concert_type, comments: auditionProperty.comments, memorized: auditionProperty.memorized, scale1: auditionProperty.scale1, scale2: auditionProperty.scale2, scale3: auditionProperty.scale3, scale4: auditionProperty.scale4, scale5: auditionProperty.scale5, chromatic_scale: auditionProperty.chromatic_scale, etude1_pitch: auditionProperty.etude1_pitch, etude1_rhythm: auditionProperty.etude1_rhythm, etude1_articulation: auditionProperty.etude1_articulation, etude1_dynamics: auditionProperty.etude1_dynamics, etude1_tone: auditionProperty.etude1_tone, etude1_style: auditionProperty.etude1_style, etude2_pitch: auditionProperty.etude2_pitch, etude2_rhythm: auditionProperty.etude2_rhythm, etude2_articulation: auditionProperty.etude2_articulation, etude2_dynamics: auditionProperty.etude2_dynamics, etude2_tone: auditionProperty.etude2_tone, etude2_style: auditionProperty.etude2_style, read_pitch: auditionProperty.read_pitch, read_rhythm: auditionProperty.read_rhythm, finalScore: auditionProperty.finalScore)
        
        let information = auditionData.instrument
        if auditionData.concert_type == "Varsity" //Checks which 2D array I must save to
        {
            switch information
            {
            case "Flute":
                varsityAuditions[0].append(auditionData)
            case "Oboe":
                varsityAuditions[1].append(auditionData)
            case "Clarinet":
                varsityAuditions[2].append(auditionData)
            case "Bass Clarinet":
                varsityAuditions[3].append(auditionData)
            case "Bassoon":
                varsityAuditions[4].append(auditionData)
            case "Alto Saxophone":
                varsityAuditions[5].append(auditionData)
            case "Tenor Saxophone":
                varsityAuditions[6].append(auditionData)
            case "Bari Saxophone":
                varsityAuditions[7].append(auditionData)
            case "Trumpet":
                varsityAuditions[8].append(auditionData)
            case "French Horn":
                varsityAuditions[9].append(auditionData)
            case "Trombone":
                varsityAuditions[10].append(auditionData)
            case "Euphonium":
                varsityAuditions[11].append(auditionData)
            case "String Bass":
                varsityAuditions[12].append(auditionData)
            case "Tuba":
                varsityAuditions[13].append(auditionData)
            default:
                Swift.print("Save failed, varsity winds audition. instrument = \(information)")
            }
            saveVarsityAuditions()
        }
        else //String reads "Freshmen"
        {
            switch information
            {
            case "Flute":
                freshmenAuditions[0].append(auditionData)
            case "Oboe":
                freshmenAuditions[1].append(auditionData)
            case "Clarinet":
                freshmenAuditions[2].append(auditionData)
            case "Bass Clarinet":
                freshmenAuditions[3].append(auditionData)
            case "Bassoon":
                freshmenAuditions[4].append(auditionData)
            case "Alto Saxophone":
                freshmenAuditions[5].append(auditionData)
            case "Tenor Saxophone":
                freshmenAuditions[6].append(auditionData)
            case "Bari Saxophone":
                freshmenAuditions[7].append(auditionData)
            case "Trumpet":
                freshmenAuditions[8].append(auditionData)
            case "French Horn":
                freshmenAuditions[9].append(auditionData)
            case "Trombone":
                freshmenAuditions[10].append(auditionData)
            case "Euphonium":
                freshmenAuditions[11].append(auditionData)
            case "String Bass":
                freshmenAuditions[12].append(auditionData)
            case "Tuba":
                freshmenAuditions[13].append(auditionData)
            default:
                Swift.print("Save failed, freshmen winds audition. instrument = \(information)")
            }
            saveFreshmenAuditions()
        }
        resetAuditionProperty(sender)
    }
    
    func loadData()
    {
        Swift.print("HEY! Link Listen! - Navi")
        if auditionProperty.concert_type == "Varsity"
        {
            loadVarsityAuditions()
            for i in 0..<varsityAuditions.count
            {
                for j in 0..<varsityAuditions[i].count
                {
                    print("\(i), \(j), \(varsityAuditions[i][j]), \(varsityAuditions[i][j].first_name), \(varsityAuditions[i][j].last_name)")
                }
            }
        }
        else
        {
            loadFreshmenAuditions()
            for i in 0..<freshmenAuditions.count
            {
                for j in 0..<freshmenAuditions[i].count
                {
                    print("\(i), \(j), \(freshmenAuditions[i][j]), \(freshmenAuditions[i][j].first_name), \(freshmenAuditions[i][j].last_name)")
                }
                
            }
        }
    }
    
    @IBAction func resetAuditionProperty(_ sender: UIButton)
    {
        let ZERO: Double = 0
        let BLANK: String = ""
        
        auditionProperty.first_name = BLANK
        auditionProperty.last_name = BLANK
        auditionProperty.instrument = BLANK
        auditionProperty.concert_type = BLANK
        auditionProperty.comments = BLANK
        auditionProperty.memorized = false
        
        auditionProperty.scale1 = ZERO
        auditionProperty.scale2 = ZERO
        auditionProperty.scale3 = ZERO
        auditionProperty.scale4 = ZERO
        auditionProperty.scale5 = ZERO
        auditionProperty.chromatic_scale = ZERO
        
        auditionProperty.etude1_pitch = ZERO
        auditionProperty.etude1_rhythm = ZERO
        auditionProperty.etude1_articulation = ZERO
        auditionProperty.etude1_dynamics = ZERO
        auditionProperty.etude1_tone = ZERO
        auditionProperty.etude1_style = ZERO
        
        auditionProperty.etude2_pitch = ZERO
        auditionProperty.etude2_rhythm = ZERO
        auditionProperty.etude2_articulation = ZERO
        auditionProperty.etude2_dynamics = ZERO
        auditionProperty.etude2_tone = ZERO
        auditionProperty.etude2_style = ZERO
        
        auditionProperty.read_pitch = ZERO
        auditionProperty.read_rhythm = ZERO
        
        auditionProperty.finalScore = ZERO
    }
    
    //Following function rotates the UISegmentedControl 1/2 pi radians
    func setUpDataControl(object: UISegmentedControl)
    {
        object.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2.0))
        //Previous line rotates segmented control 90 degrees.
        
        for view in object.subviews
        {
            for subview in view.subviews
            {
                subview.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI / 2.0))
                if let segmentLabel = subview as? UILabel //Allows changes to the UILabel in each segment
                {
                    segmentLabel.numberOfLines = 3 //Makes it possible to have three lines in the view
                    segmentLabel.adjustsFontSizeToFitWidth = true//Readjusts the font so the words don't end up truncated to the next line. The previous two lines only effect the first index in the UISegmented Label.
                }
            }
        }//This Rotates the text 90 degrees so it is horizontal for the user
        
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
    
    func segmentedControlValueChanged(segment: UISegmentedControl)
    {
        let controlIndex: Int = self.dataControl.selectedSegmentIndex
        switch controlIndex
        {
        case 0: //Knowledge & Performance
            upperLeftLabel.setTitle("Scale 1", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.scale1)", for: .normal)
            
            upperRightLabel.setTitle("Scale 2", for: .normal)
            upperRightData.setTitle("\(auditionProperty.scale2)", for: .normal)
            
            middleLeftLabel.setTitle("Scale 3", for: .normal)
            middleLeftData.setTitle("\(auditionProperty.scale3)", for: .normal)
            
            middleRightLabel.setTitle("Scale 4", for: .normal)
            middleRightData.setTitle("\(auditionProperty.scale4)", for: .normal)
            
            lowerLeftLabel.setTitle("Scale 5", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.scale5)", for: .normal)
            
            lowerRightLabel.setTitle("Chromatic Scale", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.chromatic_scale)", for: .normal)
            
            upperRightStack.isHidden = false
            upperLeftStack.isHidden = false
            middleLeftStack.isHidden = false
            middleRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
        case 1: //Etude 1
            upperLeftLabel.setTitle("Pitch Production", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.etude1_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Rhythm Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.etude1_rhythm)", for: .normal)
            
            middleLeftLabel.setTitle("Articulation", for: .normal)
            middleLeftData.setTitle("\(auditionProperty.etude1_articulation)", for: .normal)
            
            middleRightLabel.setTitle("Dynamics", for: .normal)
            middleRightData.setTitle("\(auditionProperty.etude1_dynamics)", for: .normal)
            
            lowerLeftLabel.setTitle("Tone", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.etude1_tone)", for: .normal)
            
            lowerRightLabel.setTitle("Superior Expression & Style", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.etude1_style)", for: .normal)
            
            upperRightStack.isHidden = false
            upperLeftStack.isHidden = false
            middleLeftStack.isHidden = false
            middleRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
        case 2: //Etude 2
            upperLeftLabel.setTitle("Pitch Production", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.etude2_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Rhythm Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.etude2_rhythm)", for: .normal)
            
            middleLeftLabel.setTitle("Articulation", for: .normal)
            middleLeftData.setTitle("\(auditionProperty.etude2_articulation)", for: .normal)
            
            middleRightLabel.setTitle("Dynamics", for: .normal)
            middleRightData.setTitle("\(auditionProperty.etude2_dynamics)", for: .normal)
            
            lowerLeftLabel.setTitle("Tone", for: .normal)
            lowerLeftData.setTitle("\(auditionProperty.etude2_tone)", for: .normal)
            
            lowerRightLabel.setTitle("Superior Expression & Style", for: .normal)
            lowerRightData.setTitle("\(auditionProperty.etude2_style)", for: .normal)
            
            upperRightStack.isHidden = false
            upperLeftStack.isHidden = false
            middleLeftStack.isHidden = false
            middleRightStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
        case 3: //Sight Read
            upperLeftLabel.setTitle("Pitch Production", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.read_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Rhythm Production", for: .normal)
            upperRightData.setTitle("\(auditionProperty.read_rhythm)", for: .normal)
            
            upperRightStack.isHidden = false
            upperLeftStack.isHidden = false
            middleLeftStack.isHidden = true
            middleRightStack.isHidden = true
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
        default:
            Swift.print("Default case in segmentedControlValueChanged. controlIndex: \(controlIndex)")
        }
    }
    
    @IBAction func memorizedChanged(_ sender: UISwitch)
    {
        auditionProperty.memorized = sender.isOn
        calculateFinalScore()
        finalScoreLabel.text = "Total: \(auditionProperty.finalScore)"
    }
 
    /*
     The following two methods assign values to button labels. It sets things up for the keyboard popover and retrieves data from the popover.
     */
    @IBAction func changeDataValue(_ sender: UIButton)
    {
        //Next line of code stores which button was pressed
        senderButton = sender.restorationIdentifier!
        //Next line of code tells the popover keyboard that we want an Int in a string
        keyboardIsEditingInt = false
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
        let index: Int = dataControl.selectedSegmentIndex
        switch senderButton
        {
        case "upperLeftData":
            upperLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            
            switch index
            {
            case 0: //Knowledge & Performance
                auditionProperty.scale1 = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_pitch = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_pitch = Double(returnedValue)!
            case 3: //Sight Reading
                auditionProperty.read_pitch = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperLeftData. index = \(index)")
            }
        case "upperRightData":
            upperRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            switch index
            {
            case 0: //Knowledge & Performance
                auditionProperty.scale2 = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_rhythm = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_rhythm = Double(returnedValue)!
            case 3: //Sight Reading
                auditionProperty.read_rhythm = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperRightData. index = \(index)")
            }
        case "middleLeftData":
            middleLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            switch index
            {
            case 0: //Knowledge & performance
                auditionProperty.scale3 = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_articulation = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_articulation = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case middleLeftData. index = \(index)")
            }
        case "middleRightData":
            middleRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            switch index
            {
            case 0: //Knowledge & performance
                auditionProperty.scale4 = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_dynamics = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_dynamics = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case middleRightData. index = \(index)")
            }
        case "lowerLeftData":
            lowerLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            switch index
            {
            case 0: //Knowledge & performance
                auditionProperty.scale5 = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_tone = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_tone = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerRightData. index = \(index)")
            }
        case "lowerRightData":
            lowerRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionProperty object
            switch index
            {
            case 0: //Knowledge & performance
                auditionProperty.chromatic_scale = Double(returnedValue)!
            case 1: //Etude 1
                auditionProperty.etude1_style = Double(returnedValue)!
            case 2: //Etude 2
                auditionProperty.etude2_style = Double(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerRightData. index = \(index)")
            }
        default:
            Swift.print("Error, default case in recieveKeyboardData was called. senderButton= \(senderButton)")
        }
        //Now it calculates the final score of the items and sets the title of the final score to that.
        calculateFinalScore()
        finalScoreLabel.text = "Total: \(auditionProperty.finalScore)"
    }
    func calculateFinalScore()
    {
    var score: Double = auditionProperty.scale1 + auditionProperty.scale2 + auditionProperty.scale3 + auditionProperty.scale4 + auditionProperty.scale5 + auditionProperty.etude1_style + auditionProperty.etude1_tone + auditionProperty.etude1_dynamics + auditionProperty.etude1_articulation + auditionProperty.etude1_rhythm + auditionProperty.etude1_pitch + auditionProperty.etude2_rhythm + auditionProperty.etude2_tone + auditionProperty.etude2_pitch + auditionProperty.etude2_style + auditionProperty.etude2_dynamics + auditionProperty.etude2_articulation + auditionProperty.read_rhythm + auditionProperty.read_pitch
    if auditionProperty.memorized
        {
            score = score + 1
        }
    auditionProperty.finalScore = score
    }
}
