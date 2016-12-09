//
//  jazzAudition.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
class jazzDrumset: audition //Audition is the protocol
{
    var first_name: String
    var last_name: String
    var instrument: String
    var preferredRange: String
    var comments: String
    
    var swing_Support: Int
    var swing_Stability: Int
    var swing_Articulations: Int
    
    var improvisation: Int
    var leftHand_Independence: Int
    
    var straight_Support: Int
    var straight_Stability: Int
    var straight_Articulations: Int
    
    var sight_Support: Int
    var sight_Stability: Int
    var sight_Articulations: Int
    
    var finalScore: Int

    init(instrument: String)
    {
        first_Name = ""
        last_Name = ""
        self.instrument = instrument
        preferredRange = ""
        comments = ""
        
        swing_Support = 0
        swing_Stability = 0
        swing_Articulations = 0
        
        improvisation = 0
        leftHand_Independence = 0
        
        straight_Support = 0
        straight_Stability = 0
        straight_Articulations = 0
        
        sight_Support = 0
        sight_Stability = 0
        sight_Articulations = 0
        
        finalScore = 0
    }
}
