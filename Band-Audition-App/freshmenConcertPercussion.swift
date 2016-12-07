//
//  freshmenConcertPercussion.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
class freshmenConcertPercussion
{
    var first_name: String
    var last_name: String
    var instrument: String
    var comments: String
    
    var scale1_pitch: Int
    var scale1_production: Int
    var scale2_pitch: Int
    var scale2_production: Int
    
    var snare_rhythm: Int
    var snare_tempo: Int
    var snare_dynamic: Int
    var snare_production: Int
    
    var mallet_rhythm: Int
    var mallet_tempo: Int
    var mallet_dynamic: Int
    var mallet_production: Int
    
    var snareRead_rhythm: Int
    var snareRead_production: Int
    
    var malletRead_rhythm: Int
    var malletRead_pitch: Int
    var malletRead_production: Int
    
    var finalScore: Int
    
    init(instrument: String)
    {
        first_name = ""
        last_name = ""
        self.instrument = instrument
        comments = ""
        
        scale1_pitch = 0
        scale1_production = 0
        scale2_pitch = 0
        scale2_production = 0
        
        snare_rhythm = 0
        snare_tempo = 0
        snare_dynamic = 0
        snare_production = 0
        
        mallet_rhythm = 0
        mallet_tempo = 0
        mallet_dynamic = 0
        mallet_production = 0
        
        snareRead_rhythm = 0
        snareRead_production = 0
        
        malletRead_rhythm = 0
        malletRead_pitch = 0
        malletRead_production = 0
        
        finalScore = 0
    }
}
