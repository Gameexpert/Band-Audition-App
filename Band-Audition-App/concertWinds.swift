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
    
    struct propertyKey
    {
        static var first_name = "first_name"
        static var last_name = "last_name"
        static var instrument = "instrument"
        static var concert_type = "concert_type"
        static var comments = "comments"
        static var memorized = "memorized"
        
        static var scale1 = "scale1"
        static var scale2 = "scale2"
        static var scale3 = "scale3"
        static var scale4 = "scale4"
        static var scale5 = "scale5"
        
        static var chromatic_scale = "chromatic_scale"
        static var etude1_pitch = "etude1_pitch"
        static var etude1_rhythm = "etude1_rhythm"
        static var etude1_articulation = "etude1_articulation"
        static var etude1_dynamics = "etude1_dynamics"
        static var etude1_tone = "etude1_tone"
        static var etude1_style = "etude1_style"
        
        static var etude2_pitch = "etude2_pitch"
        static var etude2_rhythm = "etude2_rhythm"
        static var etude2_articulation = "etude2_articulation"
        static var etude2_dynamics = "etude2_dynamics"
        static var etude2_tone = "etude2_tone"
        static var etude2_style = "etude2_style"
        
        static var read_pitch = "read_pitch"
        static var read_rhythm = "read_rhythm"
        static var finalScore = "finalScore"
    }
    
    init(first_name: String, last_name: String, instrument: String, concert_type: String, comments: String, memorized: Bool, scale1: Double, scale2: Double, scale3: Double, scale4: Double, scale5: Double)
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
    
    
}
