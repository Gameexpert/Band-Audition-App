//
//  concertWinds.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
class concertWinds: audition //Audition is the protocol
{
   //MARK: Properties
    var first_name: String
    var last_name: String
    var instrument: String
    var concert_type: String //Either "Varsity" or "Freshmen"
    var comments: String
    var memorized: Bool
    
    var scale1: Double
    var scale2: Double
    var scale3: Double
    var scale4: Double
    var scale5: Double
    
    var chromatic_scale: Double
    var etude1_pitch: Double
    var etude1_rhythm: Double
    var etude1_articulation: Double
    var etude1_dynamics: Double
    var etude1_tone: Double
    var etude1_style: Double
    
    var etude2_pitch: Double
    var etude2_rhythm: Double
    var etude2_articulation: Double
    var etude2_dynamics: Double
    var etude2_tone: Double
    var etude2_style: Double
    
    var read_pitch: Double
    var read_rhythm: Double
    var finalScore: Double
    
    init(instrument: String, category: String)
    {
        first_name = ""
        last_name = ""
        self.instrument = instrument
        self.concert_type = category
        comments = ""
        memorized = false
        
        scale1 = 0.0
        scale2 = 0.0
        scale3 = 0.0
        scale4 = 0.0
        scale5 = 0.0
        
        chromatic_scale = 0.0
        etude1_pitch = 0.0
        etude1_rhythm = 0.0
        etude1_articulation = 0.0
        etude1_dynamics = 0.0
        etude1_tone = 0.0
        etude1_style = 0.0
        
        etude2_pitch = 0.0
        etude2_rhythm = 0.0
        etude2_articulation = 0.0
        etude2_dynamics = 0.0
        etude2_tone = 0.0
        etude2_style = 0.0
        
        read_pitch = 0.0
        read_rhythm = 0.0
        finalScore = 0.0
    }
    func calculateFinalScore() -> Double
    {
        var score: Double = scale1 + scale2 + scale3 + scale4 + scale5
        score = score + chromatic_scale + etude1_pitch + etude1_rhythm + etude1_articulation + etude1_dynamics + etude1_tone + etude1_style
        score = score + etude2_pitch + etude2_rhythm + etude2_articulation + etude2_dynamics + etude2_tone + etude2_style
        score = score + read_pitch + read_rhythm
        if memorized == true
        {
            score += 1
        }
        self.finalScore = score
        return finalScore
    }
}
