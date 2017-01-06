//
//  FPAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 12/14/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation

class FPAuditionViewController: UIViewController, UITextViewDelegate
{
    //MARK Properties
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var commentsField: UITextView!
    var keyboardHeight: Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Audition Layout
        
        let frame1 = CGRect(x: 10, y: 121, width: 748, height: 751)
        let dataBorder = UIView(frame: frame1) //Largest Border
        dataBorder.backgroundColor = UIColor.clear
        dataBorder.layer.borderWidth = 1.0
        view.addSubview(dataBorder) //Adds the rectangle to the heirarchy of the view and allows it to be seen
        
        let frame2 = CGRect(x: 10, y: 880, width: 500, height: 137)
        let commentBorder = UIView(frame: frame2) //Border around the text view
        commentBorder.backgroundColor = UIColor.clear
        commentBorder.layer.borderWidth = 1.0
        view.addSubview(commentBorder)
        commentBorder.addSubview(commentsField) //This makes the text field higher on the hierarchy so it's editable
        
        let line1 = CGRect(x: 150, y: 0, width: 1, height: 750)
        let dataLine = UIView(frame: line1)
        dataLine.layer.borderWidth = 1.0
        //dataBorder.addSubview(dataLine)
        
        //This next portion is programmatically adding the UISegmentedControl
        let dataControl = UISegmentedControl(items: ["Scale 1","Scale 2", "Snare Etude","Mallet Etude","Snare Reading","Mallet Reading"])
        let xPosition: CGFloat = -300
        let yPosition: CGFloat = 301
        let elementWidth: CGFloat = 751
        let elementHeight: CGFloat = 150
        dataControl.frame = CGRect(x: xPosition, y: yPosition, width: elementWidth, height: elementHeight)
        dataControl.selectedSegmentIndex = 0
        
        dataBorder.addSubview(dataControl)
        setUpDataControl(object: dataControl)
        
        commentsField!.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(FPAuditionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
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
    
    func keyboardWillShow(notification:NSNotification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        self.keyboardHeight = Int(keyboardRectangle.height)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -(CGFloat(keyboardHeight)))
        textView.text = ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy:CGFloat(keyboardHeight))
    }
    
}
