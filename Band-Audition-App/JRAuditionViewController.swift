//
//  JRAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 3/14/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

class JRAuditionViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, UITextFieldDelegate
{
    //MARK: Properties
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Swing Etude","Straight Etude", "Sight Reading"])
    @IBOutlet weak var commentsView: UITextView!
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var upperLeftStack: UIStackView!
    @IBOutlet weak var upperRightStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var improvisationStack: UIStackView!
    @IBOutlet weak var leftHandStack: UIStackView!
    
    @IBOutlet weak var upperLeftLabel: UIButton!
    @IBOutlet weak var upperLeftData: UIButton!
    
    @IBOutlet weak var upperRightLabel: UIButton!
    @IBOutlet weak var upperRightData: UIButton!
    
    @IBOutlet weak var middleLabel: UIButton!
    @IBOutlet weak var middleData: UIButton!
    
    @IBOutlet weak var improvisationLabel: UIButton!
    @IBOutlet weak var improvisationData: UIButton!
    
    @IBOutlet weak var leftHandLabel: UIButton!
    @IBOutlet weak var leftHandData: UIButton!
    

    struct auditionProperty
    {
        static var first_name: String = ""
        static var last_name: String = ""
        static var instrument: String = ""
        static var comments: String = ""
        
        static var swing_Production: Int = 0
        static var swing_Rhythm: Int = 0
        static var swing_Articulations: Int = 0
        
        static var straight_Production: Int = 0
        static var straight_Rhythm: Int = 0
        static var straight_Articulations: Int = 0
        
        static var sight_Production: Int = 0
        static var sight_Rhythm: Int = 0
        static var sight_Articulations: Int = 0
        
        static var improvisation: Int = 0
        static var leftHand_Independence: Int = 0
        
        static var finalScore: Int = 0
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.instrumentNameLabel.text! = instrumentType
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
        NotificationCenter.default.addObserver(self, selector: #selector(JDAuditionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector (JDAuditionViewController.recieveKeyboardData), name: NSNotification.Name(rawValue: "popoverKeyboardDidFinishEditing"), object: nil)
        
        dataControl.addTarget(self, action: #selector(JRAuditionViewController.segmentedControlValueChanged), for: .allEvents)
        
        segmentedControlValueChanged(segment: dataControl)
        
        //loadData()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    func keyboardWillShow(notification:NSNotification)
    {
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
    
    @IBAction func saveData(_ sender: UIButton)
    {
        self.view.endEditing(true)//Dismisses the keyboard, if it exists. This forces a save of the name properties before we actually save any of the data.
        let auditionData: jazzRhythms = jazzRhythms(first_name: auditionProperty.first_name, last_name: auditionProperty.last_name, instrument: auditionProperty.instrument, comments: auditionProperty.comments, swing_Production: auditionProperty.swing_Production, swing_Rhythm: auditionProperty.swing_Rhythm, swing_Articulations: auditionProperty.swing_Articulations, straight_Production: auditionProperty.straight_Production, straight_Rhythm: auditionProperty.straight_Rhythm, straight_Articulations: auditionProperty.straight_Articulations, sight_Production: auditionProperty.sight_Production, sight_Rhythm: auditionProperty.sight_Rhythm, sight_Articulations: auditionProperty.sight_Articulations, improvisation: auditionProperty.improvisation, leftHand_Independence: auditionProperty.leftHand_Independence, finalScore: auditionProperty.finalScore)
        switch instrumentType
        {
        case "Saxophone":
            <#code#>
        case "Trombone":
        case "Trumpet":
        default:
            <#code#>
        }
        saveJazzAuditions()
        
        //resetAuditionProperty(sender)
    }
   
    
    func segmentedControlValueChanged(segment: UISegmentedControl)
    {
        let controlIndex: Int = self.dataControl.selectedSegmentIndex
        switch controlIndex
        {
        case 0: //Swing Etude
            upperLeftLabel.setTitle("Pitch Production", for: .normal)
            upperLeftData.setTitle("\(auditionProperty.swing_Production)", for: .normal)
            
            upperRightLabel.setTitle("Rhythmic Accuracy", for: .normal)
            upperRightData.setTitle("\(auditionProperty.swing_Rhythm)", for: .normal)
            
            middleLabel.setTitle("Articulations and Jazz Feel", for: .normal)
            middleData.setTitle("\(auditionProperty.swing_Articulations)", for: .normal)
            
        case 1: //Straight Etude
            upperLeftData.setTitle("\(auditionProperty.straight_Production)", for: .normal)
            
            upperRightData.setTitle("\(auditionProperty.straight_Rhythm)", for: .normal)
            
            middleData.setTitle("\(auditionProperty.straight_Articulations)", for: .normal)
            
        case 2: //Sight Reading
            upperLeftData.setTitle("\(auditionProperty.sight_Production)", for: .normal)
            
            upperRightData.setTitle("\(auditionProperty.sight_Rhythm)", for: .normal)
            
            middleData.setTitle("\(auditionProperty.sight_Articulations)", for: .normal)
            
        default:
            Swift.print("segmentedControlValueChanged Default Called")
        }
        improvisationData.setTitle("\(auditionProperty.improvisation)", for: .normal)
        leftHandData.setTitle("\(auditionProperty.leftHand_Independence)", for: .normal)
    }
    
    func calculateFinalScore()
    {
        //Next five statements adds every single int together
        var score: Int = auditionProperty.swing_Production + auditionProperty.swing_Rhythm + auditionProperty.swing_Articulations
        score = score + auditionProperty.straight_Production + auditionProperty.straight_Rhythm + auditionProperty.straight_Articulations
        score = score + auditionProperty.sight_Production + auditionProperty.sight_Rhythm + auditionProperty.sight_Articulations
        score = score + auditionProperty.improvisation + auditionProperty.leftHand_Independence
        
        auditionProperty.finalScore = score
    }

}
