//
//  LabelPopOverViewController.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 1/11/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

//MARK: Global Properties related to this class
var desiredLabel: String = "Error"

class LabelPopOverViewController: UIViewController
{
    //MARK: Properties
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: Library of Label Texts
    //Descriptions for Percussion Forms
    let rhythmicAccuracy: String = "Rhythmic Accuracy is scored on the amount of rhythmic errors made while playing any of the etudes or sight reading. Rhythms include accurate playing and lengths of rolls. Each rhythmic error will reduce the score by 1 point."
    let pitchAccuracy: String = "Pitch Accuracy is scored on the amount of individually melodic errors made while playing any of the etudes or sight reading. Each missed pitch will reduce the score by 1 point."
    let tempoAccuracy: String = "Tempo Accuracy is scored on the amount of measures played accurately to the marked tempo for the etude or sight reading. For every 5 beats-per-minute off of the written tempo, 1 point will be deducted (5 bpm off = 1, 10 bpm off = 2, etc.).  For every bar that is played with a tempo fluctuation or inconsistency, 2 points will be deducted. "
    let dynamicAccuracy: String = "Dynamic Accuracy is scored on the amount of dynamic mistakes made during any of the etudes or sight reading.  Score is determined based on how many dynamic markings exist in the excerpt.  If there are only two separate dynamics, then each one is worth 10 points.  If there are three, each dynamic is worth 7 points (7+7+6).  That pattern continues on to fluctuate for each excerpt."
    let soundProduction: String = "Sound Production is scored on the quality of sound produced on the appropriate instrument. Snare head playing positions and where mallets are striking the timpani and marimba bars are the focal point. For every measure that includes an error or inconsistent sound production, 1-2 points will be deducted."
    //Descriptions for Jazz Forms
    let supportOfWinds: String = "50 = accurate, precise, no hesitation\n40-49 = hesitations, 1-2 errors or corrections\n30-39 = 3 or more errors or corrections\n20-29 = frequent or repeated errors\n10-19 = seldom performs rhythms accurately"
    let timeStability: String = "50 = accurate, precise, no instability\n40-49 = slight instability, 1-2 errors\n30-39 = 3 or more errors or corrections\n20-29 = frequent or repeated instability\n10-19 = seldom keeps stable time"
    let articulationsJazzFeel: String = "50-40 = plays with great sensitivity & balance\n30-39 = plays with good sensitivity & balance\n20-29 = plays the style but sounds mechanical\n10-19 = very mechanical & poor balance\n0-9 = ohmigosh"
    let improvisation: String = "(drums, 1x through)\n50-40 = great notes & rhythm, swings doing it\n30-39 = good notes/rhythm, style diminishes\n20-29 = some OK note/rhythm choices\n10-19 = gave it a shot, but it's not happening\n10 = chose NOT to improvise, repeated melody"
    let leftHandIndependence: String = "50 = accurate, precise, no hesitation\n40-49 = hesitations, 1-2 errors or corrections\n30-39 = 3 or more errors or corrections\n20-29 = frequent or repeated errors\n10-19 = seldom performs rhythms accurately"
    //Descriptions for Wind form
    
  
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        //Modifying the label
        descriptionLabel.textAlignment = .center
        descriptionLabel.text! = setDescription()//Sets the text
        descriptionLabel.sizeToFit()//Resizes the label to fit horizontally
        //let labelHeight = descriptionLabel.frame.size.height
        preferredContentSize = CGSize(width: 200, height: 250)
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDescription() -> String
    {
        //Uses the "library" of label texts that are class variables.
        switch desiredLabel {
        case "Rhythmic Accuracy":
            return rhythmicAccuracy
        case "Pitch Accuracy":
            return pitchAccuracy
        case "Tempo Accuracy":
            return tempoAccuracy
        case "Dynamic Accuracy":
            return dynamicAccuracy
        case "Sound Production":
            return soundProduction
        case "Support Of Winds":
            return supportOfWinds
        case "Time Stability":
            return timeStability
        case "Articulations and Jazz Feel":
            return articulationsJazzFeel
        case "Improvisation":
            return improvisation
        case "Left Hand Independence":
            return leftHandIndependence
        default:
            Swift.print("setDescription Default case called. desiredLabel: \(desiredLabel)")
            return "Default Called"
        }
        
    }
}
