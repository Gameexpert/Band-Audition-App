//
//  JRAuditionViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 3/14/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

class JRAuditionViewController: UIViewController
{
    @IBOutlet weak var instrumentNameLabel: UILabel!
    
    var dataControl: UISegmentedControl = UISegmentedControl(items: ["Swing Etude","Straight Etude", "Sight Reading"])
    
    var keyboardHeight: Int = 0
    var textViewCleared: Bool = false

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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
