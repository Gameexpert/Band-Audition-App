//
//  concertWindsViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 3/6/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
import Foundation

class concertWindsViewController: UIViewController
{
    //MARK: Properties
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var upperLeftLabel: UILabel!
    @IBOutlet weak var upperLeftData: UIButton!
    
    @IBOutlet weak var upperRightLabel: UILabel!
    @IBOutlet weak var upperRightData: UIButton!
    
    @IBOutlet weak var middleLeftLabel: UILabel!
    @IBOutlet weak var middleLeftData: UIButton!
    
    @IBOutlet weak var middleRightLabel: UILabel!
    @IBOutlet weak var middleRightData: UIButton!
    
    @IBOutlet weak var lowerLeftLabel: UILabel!
    @IBOutlet weak var lowerLeftData: UIButton!
    
    @IBOutlet weak var lowerRightLabel: UILabel!
    @IBOutlet weak var lowerRightData: UIButton!
    
    
    //commentsView related objects
    @IBOutlet weak var commentsView: UITextView!
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false

    /*
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
     */
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
