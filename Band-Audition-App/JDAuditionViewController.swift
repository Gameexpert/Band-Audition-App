//
//  JDAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 2/22/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

class JDAuditionViewController: UIViewController
{
    //MARK Properties
    @IBOutlet weak var instrumentNameLabel: UILabel!
    @IBOutlet weak var firstNameBox: UITextField!
    @IBOutlet weak var lastNameBox: UITextField!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Scale 1","Scale 2", "Snare Etude","Mallet Etude","Snare Reading","Mallet Reading"])
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
        
        static var scale1_pitch: Int = 0
        static var scale1_production: Int = 0
        static var scale2_pitch: Int = 0
        static var scale2_production: Int = 0
        
        static var snare_rhythm: Int = 0
        static var snare_tempo: Int = 0
        static var snare_dynamic: Int = 0
        static var snare_production: Int = 0
        
        static var mallet_rhythm: Int = 0
        static var mallet_pitch: Int = 0
        static var mallet_tempo: Int = 0
        static var mallet_dynamic: Int = 0
        static var mallet_production: Int = 0
        
        static var snareRead_rhythm: Int = 0
        static var snareRead_production: Int = 0
        
        static var malletRead_rhythm: Int = 0
        static var malletRead_pitch: Int = 0
        static var malletRead_production: Int = 0
        
        static var finalScore: Int = 0
    }

    
    
    override func viewDidLoad() {
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
