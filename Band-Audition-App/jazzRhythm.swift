//
//  jazzRhythm.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
class jazzRhythm: audition //Audition is the protocol
{
    var first_name: String
    var last_name: String
    var instrument: String
    var comments: String
    var prefferedRange: String
    
    var swing_Production: Int
    var swing_Rhythm: Int
    var swing_Articulations: Int
    
    var improvisation: Int
    var leftHand_Independence: Int
    
    var straight_Production: Int
    var straight_Rhythm: Int
    var straight_Articulations: Int
    
    var sight_Production: Int
    var sight_Rhythm: Int
    var sight_Articulations: Int
    
    var finalScore: Int
    
    init(instrument: String)
    {
        first_name = ""
        last_name = ""
        self.instrument = instrument
        prefferedRange = ""
        comments = ""
        
        swing_Production = 0
        swing_Rhythm = 0
        swing_Articulations = 0
        
        improvisation = 0
        leftHand_Independence = 0
        
        straight_Production = 0
        straight_Rhythm = 0
        straight_Articulations = 0
        
        sight_Production = 0
        sight_Rhythm = 0
        sight_Articulations = 0
        
        finalScore = 0
    }
}
