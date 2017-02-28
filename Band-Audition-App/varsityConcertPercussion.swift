//
//  varsityConcertPercussion.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
class varsityConcertPercussion: audition //Audition is the protocol
{
    var first_name: String
    var last_name: String
    var instrument: String
    var comments: String
    
    var scale1_pitch: Int
    var scale1_production: Int
    var scale2_pitch: Int
    var scale2_production: Int
    var scale3_pitch: Int
    var scale3_production: Int
    
    var snare_rhythm: Int
    var snare_tempo: Int
    var snare_dynamic: Int
    var snare_production: Int
    
    var mallet_rhythm: Int
    var mallet_pitch: Int
    var mallet_tempo: Int
    var mallet_dynamic: Int
    var mallet_production: Int
    
    var timpani_rhythm: Int
    var timpani_tempo: Int
    var timpani_dynamic: Int
    var timpani_production: Int
    
    var snareRead_rhythm: Int
    var snareRead_production: Int
    
    var malletRead_rhythm: Int
    var malletRead_pitch: Int
    var malletRead_production: Int
    
    var finalScore: Int
    
    //MARK: Types
    struct propertyKey
    {
        static var first_name = "first_name"
        static var last_name = "last_name"
        static var instrument = "instrument"
        
        static var scale1_pitch = "scale1_pitch"
        static var scale1_production = "scale1_production"
        
        static var scale2_pitch = "scale2_pitch"
        static var scale2_production = "scale2_production"
        
        static var scale3_pitch = "scale3_pitch"
        static var scale3_production = "scale3_production"
        
        static var snare_rhythm = "snare_rhythm"
        static var snare_tempo = "snare_tempo"
        static var snare_dynamic = "snare_dynamic"
        static var snare_production = "snare_production"
        
        static var mallet_rhythm = "mallet_rhythm"
        static var mallet_pitch = "mallet_pitch"
        static var mallet_tempo = "mallet_tempo"
        static var mallet_dynamic = "mallet_dynamic"
        static var mallet_production = "mallet_production"
        
        static var timpani_rhythm = "timpani_rhythm"
        static var timpani_tempo = "timpani_tempo"
        static var timpani_dynamic = "timpani_dynamic"
        static var timpani_production = "timpani_production"
        
        static var snareRead_rhythm = "snareRead_rhythm"
        static var snareRead_production = "snareRead_production"
        
        static var malletRead_rhythm = "malletRead_rhythm"
        static var malletRead_ptich = "malletRead_ptich"
        static var malletRead_production = "malletRead_production"
    }
    
        
    init(first_name: String, last_name: String, instrument: String, comments: String, scale1_pitch: Int, scale1_production: Int, scale2_pitch: Int, scale2_production: Int, scale3_pitch: Int, scale3_production: Int, snare_rhythm: Int, snare_tempo: Int, snare_dynamic: Int, snare_production: Int, mallet_rhythm: Int, mallet_pitch: Int, mallet_tempo: Int, mallet_dynamic: Int, mallet_production: Int, timpani_rhythm: Int, timpani_tempo: Int, timpani_dynamic: Int, timpani_production: Int, snareRead_rhythm: Int, snareRead_production: Int, malletRead_rhythm: Int, malletRead_pitch: Int, malletRead_production: Int, finalScore: Int)
    {
        self.first_name = first_name
        self.last_name = last_name
        self.instrument = instrument
        self.comments = comments
        
        self.scale1_pitch = scale1_pitch
        self.scale1_production = scale1_production
        self.scale2_pitch = scale2_pitch
        self.scale2_production = scale2_production
        self.scale3_pitch = scale3_pitch
        self.scale3_production = scale3_production
        
        self.snare_rhythm = snare_rhythm
        self.snare_tempo = snare_tempo
        self.snare_dynamic = snare_dynamic
        self.snare_production = snare_production
        
        self.mallet_rhythm = mallet_rhythm
        self.mallet_pitch = mallet_pitch
        self.mallet_tempo = mallet_tempo
        self.mallet_dynamic = mallet_dynamic
        self.mallet_production = mallet_production
        
        self.timpani_rhythm = timpani_rhythm
        self.timpani_tempo = timpani_tempo
        self.timpani_dynamic = timpani_dynamic
        self.timpani_production = timpani_production
        
        self.snareRead_rhythm = snareRead_rhythm
        self.snareRead_production = snareRead_production
        
        self.malletRead_rhythm = malletRead_rhythm
        self.malletRead_pitch = malletRead_pitch
        self.malletRead_production = malletRead_production
        
        self.finalScore = finalScore
    }
    

}
