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
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Knowledge & Performance", "Etude 1", "Etude 2", "Sight Read"])
    
    //Structure to store data until we save the data
    struct auditionProperty
    {
        static var first_name: String = ""
        static var last_name: String = ""
        static var instrument: String = ""
        static var category: String = "" //Either "Varsity" or "Freshmen"
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
        
        var read_pitch: Double = 0
        var read_rhythm: Double = 0
        
        var finalScore: Double = 0
    }

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
