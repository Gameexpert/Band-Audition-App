//
//  FPAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 12/14/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation


class FPAuditionViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, UITextFieldDelegate
{
    //MARK Properties
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    
    
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Scale 1","Scale 2", "Snare Etude","Mallet Etude","Snare Reading","Mallet Reading"])
    @IBOutlet weak var commentsView: UITextView!
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var upperLeftStack: UIStackView!
    @IBOutlet weak var upperRIghtStack: UIStackView!
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
    
    
    var auditionData2 = freshmenConcertPercussion(instrument: instrumentType, firstname: "Error")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        self.instrumentNameLabel.text! = instrumentType
        //Sets up the data object with known variables
        auditionData2.instrument = instrumentType
        
        
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
        //dataBorder.addSubview(dataLine)
        
        //This next portion is programmatically adding the UISegmentedControl
        let xPosition: CGFloat = -300
        let yPosition: CGFloat = 301
        let elementWidth: CGFloat = 751
        let elementHeight: CGFloat = 150
        dataControl.frame = CGRect(x: xPosition, y: yPosition, width: elementWidth, height: elementHeight)
        dataControl.selectedSegmentIndex = 0
        dataBorder.addSubview(dataControl)
        setUpDataControl(object: dataControl)
        
        //Adding the Data Boxes to the dataBorder
        dataBorder.addSubview(mainStackView)

        //Adds the necessary delgates for the view
        self.commentsView.delegate = self
        self.firstNameBox.delegate = self
        self.lastNameBox.delegate = self
        
        //Creates a listener for the NSNotification center to stop the keyboard from covering the comments box
        NotificationCenter.default.addObserver(self, selector: #selector(FPAuditionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (FPAuditionViewController.recieveKeyboardData), name: NSNotification.Name(rawValue: "popoverKeyboardDidFinishEditing"), object: nil)
        
        dataControl.addTarget(self, action: #selector(FPAuditionViewController.segmentedControlValueChanged), for: .allEvents)
        
        segmentedControlValueChanged(segment: dataControl)
        
        
        freshmenAuditions[14].append(auditionData)
        
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
    
    //MARK: Functions
    
    func setUpDataControl(object: UISegmentedControl)
    {
        object.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2.0))
        //Previous line rotates segmented control 90 degrees.
        
        for view in object.subviews
        {
            for subview in view.subviews
            {
                subview.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI / 2.0))
            }
        }//This Rotates the text 90 degrees so it is horizontal for the user
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
        auditionData2.comments = textView.text! //Saves the data
    }
    
    
    @IBAction func saveData(_ sender: UIButton)
    {
        freshmenAuditions[14].append(auditionData2)
        saveFreshmenAuditions()
    }
    
    @IBAction func loadData(_ sender: UIButton)
    {
        var freshmenAuditions = loadFreshmenAuditions()!
        for i in 0..<freshmenAuditions.count
        {
            for j in 0..<freshmenAuditions[i].count
            {
                print("\(i), \(j), \(freshmenAuditions[i][j]), \(freshmenAuditions[i][j].first_name), \(freshmenAuditions[i][j].last_name)")
            }
            
        }
        
        do
        {
           let directoryContents = try FileManager.default.contentsOfDirectory(at: ArchiveURL, includingPropertiesForKeys: nil, options: [])
            let variable = String(describing: directoryContents)
            print(variable)
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
    }
    
    //Following methods assign the values to the button labels.
    @IBAction func changeDataValue(_ sender: UIButton)
    {
        //Next line of code stores which button was pressed
        senderButton = sender.restorationIdentifier!
        //Next line of code tells the popover keyboard that we want an Int in a string
        keyboardIsEditingInt = true
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
    
    //Following Function changes the data that was edited in the popover keyboard
    func recieveKeyboardData(notification: NSNotification)
    {
        //This function uses global variables (senderButton, returnedValue) found within the keyboardViewController class document. Both are strings
        switch senderButton
        {
        case "upperLeftData":
            upperLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionData2 object
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 0: //Scale 1
                auditionData2.scale1_pitch = Int(returnedValue)!
            case 1: //Scale 2
                auditionData2.scale2_pitch = Int(returnedValue)!
            case 2: //Snare Etude
                auditionData2.snare_rhythm = Int(returnedValue)!
            case 3: //Mallet Etude
                auditionData2.mallet_rhythm = Int(returnedValue)!
            case 4: //Snare Sight Reading
                auditionData2.snareRead_rhythm = Int(returnedValue)!
            case 5: //Mallet Sight Reading
                auditionData2.malletRead_rhythm = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperLeftData. index = \(index)")
            }
        case "upperRightData":
            upperRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionData2 object
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 0: //Scale 1
                auditionData2.scale1_production = Int(returnedValue)!
            case 1: //Scale 2
                auditionData2.scale2_production = Int(returnedValue)!
            case 2: //Snare Etude
                auditionData2.snare_tempo = Int(returnedValue)!
            case 3: //Mallet Etude
                auditionData2.mallet_pitch = Int(returnedValue)!
            case 4: //Snare Sight Reading
                auditionData2.snareRead_production = Int(returnedValue)!
            case 5: //Mallet Sight Reading
                auditionData2.malletRead_pitch = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case upperRightData. index = \(index)")
            }
        case "lowerLeftData":
            lowerLeftData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionData2 object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 2: //Snare Etude
                auditionData2.snare_dynamic = Int(returnedValue)!
            case 3: //Mallet Etude
                auditionData2.mallet_tempo = Int(returnedValue)!
            case 5: //Mallet Sight Reading
                auditionData2.malletRead_production = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerLeftData. index = \(index)")
            }

        case "lowerRightData":
            lowerRightData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionData2 object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 2: //Snare Etude
                auditionData2.snare_production = Int(returnedValue)!
            case 3: //Mallet Etude
                auditionData2.mallet_dynamic = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case lowerRightData. index = \(index)")
            }
        case "middleData":
            middleData.setTitle(returnedValue, for: .normal)
            //Following switch-case saves the returned value to the auditionData2 object
            //NOTICE: some cases do not exist because button is invisible!
            let index: Int = dataControl.selectedSegmentIndex
            switch index
            {
            case 3: //Mallet Etude
                auditionData2.mallet_production = Int(returnedValue)!
            default:
                Swift.print("Data didn't write, case middleData. index = \(index)")
            }
        default:
            //Given an error message in console
            Swift.print("Error, default case in recieveKeyboardData was called. senderButton = \(senderButton)")
        }
        let score: Int = auditionData2.calculateFinalScore()
        finalScoreLabel.text! = "Total: \(score)"
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        let itemName: String = textField.restorationIdentifier!
        switch itemName
        {
        case "firstNameBox":
            auditionData2.first_name = textField.text!
        case "lastNameBox":
            auditionData2.last_name = textField.text!
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
            upperLeftData.setTitle("\(auditionData2.scale1_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionData2.scale1_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
            
        case 1: //Scale 2
            upperLeftLabel.setTitle("Pitch Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionData2.scale2_pitch)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionData2.scale2_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
            
        case 2: //Snare Etude
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionData2.snare_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Tempo Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionData2.snare_tempo)", for: .normal)
            
            lowerLeftLabel.setTitle("Dynamic Accuracy", for: .normal)
            lowerLeftData.setTitle("\(auditionData2.snare_dynamic)", for: .normal)
            
            lowerRightLabel.setTitle("Sound Production", for: .normal)
            lowerRightData.setTitle("\(auditionData2.snare_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
            middleStack.isHidden = true
            
        case 3: //Mallet Etude
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionData2.mallet_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Pitch Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionData2.mallet_pitch)", for: .normal)
            
            lowerLeftLabel.setTitle("Tempo Accuracy", for: .normal)
            lowerLeftData.setTitle("\(auditionData2.mallet_tempo)", for: .normal)
            
            lowerRightLabel.setTitle("Dynamic Accuracy", for: .normal)
            lowerRightData.setTitle("\(auditionData2.mallet_dynamic)", for: .normal)
            
            middleLabel.setTitle("Sound Production", for: .normal)
            middleData.setTitle("\(auditionData2.mallet_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = false
            middleStack.isHidden = false
            
        case 4: //Snare Sight Reading
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionData2.snareRead_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Sound Production", for: .normal)
            upperRightData.setTitle("\(auditionData2.snareRead_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = true
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
            
        case 5: //Mallet Sight Reading
            upperLeftLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperLeftData.setTitle("\(auditionData2.malletRead_rhythm)", for: .normal)
            
            upperRightLabel.setTitle("Pitch Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionData2.malletRead_pitch)", for: .normal)
            
            lowerLeftLabel.setTitle("Sound Production", for: .normal)
            lowerLeftData.setTitle("\(auditionData2.malletRead_production)", for: .normal)
            
            upperLeftStack.isHidden = false
            upperRIghtStack.isHidden = false
            lowerLeftStack.isHidden = false
            lowerRightStack.isHidden = true
            middleStack.isHidden = true
        default:
            Swift.print("segmentedControlValueChanged Default Called")
        }
    }
}
