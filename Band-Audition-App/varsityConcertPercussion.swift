//
//  varsityConcertPercussion.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

class varsityConcertPercussion: NSObject, NSCoding, audition //Audition is the protocol
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
        static var comments = "comments"
        
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
        static var malletRead_pitch = "malletRead_pitch"
        static var malletRead_production = "malletRead_production"
        
        static var finalScore = "finalScore"
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
    
    func encode (with aCoder: NSCoder)
    {
        aCoder.encode(first_name, forKey: propertyKey.first_name)
        aCoder.encode(last_name, forKey: propertyKey.last_name)
        aCoder.encode(instrument, forKey: propertyKey.instrument)
        aCoder.encode(comments, forKey: propertyKey.comments)
        
        aCoder.encode(scale1_pitch, forKey: propertyKey.scale1_pitch)
        aCoder.encode(scale1_production, forKey: propertyKey.scale1_production)
        aCoder.encode(scale2_pitch, forKey: propertyKey.scale2_pitch)
        aCoder.encode(scale2_production, forKey: propertyKey.scale2_production)
        aCoder.encode(scale3_pitch, forKey: propertyKey.scale3_pitch)
        aCoder.encode(scale3_production, forKey: propertyKey.scale3_production)
        
        aCoder.encode(snare_rhythm, forKey: propertyKey.snare_rhythm)
        aCoder.encode(snare_tempo, forKey: propertyKey.snare_tempo)
        aCoder.encode(snare_dynamic, forKey: propertyKey.snare_dynamic)
        aCoder.encode(snare_production, forKey: propertyKey.snare_production)
        
        aCoder.encode(mallet_rhythm, forKey: propertyKey.mallet_rhythm)
        aCoder.encode(mallet_pitch, forKey: propertyKey.mallet_pitch)
        aCoder.encode(mallet_tempo, forKey: propertyKey.mallet_tempo)
        aCoder.encode(mallet_dynamic, forKey: propertyKey.mallet_dynamic)
        aCoder.encode(mallet_production, forKey: propertyKey.mallet_production)
        
        aCoder.encode(timpani_rhythm, forKey: propertyKey.timpani_rhythm)
        aCoder.encode(timpani_tempo, forKey: propertyKey.timpani_tempo)
        aCoder.encode(timpani_dynamic, forKey: propertyKey.timpani_dynamic)
        aCoder.encode(timpani_production, forKey: propertyKey.timpani_production)
        
        aCoder.encode(snareRead_rhythm, forKey: propertyKey.snareRead_rhythm)
        aCoder.encode(snareRead_production, forKey: propertyKey.snareRead_production)
        
        aCoder.encode(malletRead_rhythm, forKey: propertyKey.malletRead_rhythm)
        aCoder.encode(malletRead_pitch, forKey: propertyKey.malletRead_pitch)
        aCoder.encode(malletRead_production, forKey: propertyKey.malletRead_production)
        
        aCoder.encode(finalScore, forKey: propertyKey.finalScore)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        //The name is required. If we cannot decode a name string, the initializer should fail
        guard let first_name = aDecoder.decodeObject(forKey: propertyKey.first_name) as? String else {
            os_log("Unable to decode the name for a VPAudition Object.", log: OSLog.default, type: .debug)
            return nil
        }
        let last_name = aDecoder.decodeObject(forKey: propertyKey.last_name)
        let instrument = aDecoder.decodeObject(forKey: propertyKey.instrument)
        let comments = aDecoder.decodeObject(forKey: propertyKey.comments)
        
        let scale1_pitch = aDecoder.decodeInteger(forKey: propertyKey.scale1_pitch)
        let scale1_production = aDecoder.decodeInteger(forKey: propertyKey.scale1_production)
        let scale2_pitch = aDecoder.decodeInteger(forKey: propertyKey.scale2_pitch)
        let scale2_production = aDecoder.decodeInteger(forKey: propertyKey.scale2_production)
        let scale3_pitch = aDecoder.decodeInteger(forKey: propertyKey.scale3_pitch)
        let scale3_production = aDecoder.decodeInteger(forKey: propertyKey.scale3_production)
        
        let snare_rhythm = aDecoder.decodeInteger(forKey: propertyKey.snare_rhythm)
        let snare_tempo = aDecoder.decodeInteger(forKey: propertyKey.snare_tempo)
        let snare_dynamic = aDecoder.decodeInteger(forKey: propertyKey.snare_dynamic)
        let snare_production = aDecoder.decodeInteger(forKey: propertyKey.snare_production)
        
        let mallet_rhythm = aDecoder.decodeInteger(forKey: propertyKey.mallet_rhythm)
        let mallet_pitch = aDecoder.decodeInteger(forKey: propertyKey.mallet_pitch)
        let mallet_tempo = aDecoder.decodeInteger(forKey: propertyKey.mallet_tempo)
        let mallet_dynamic = aDecoder.decodeInteger(forKey: propertyKey.mallet_dynamic)
        let mallet_production = aDecoder.decodeInteger(forKey: propertyKey.mallet_production)
        
        let timpani_rhythm = aDecoder.decodeInteger(forKey: propertyKey.timpani_rhythm)
        let timpani_tempo = aDecoder.decodeInteger(forKey: propertyKey.timpani_tempo)
        let timpani_dynamic = aDecoder.decodeInteger(forKey: propertyKey.timpani_dynamic)
        let timpani_production = aDecoder.decodeInteger(forKey: propertyKey.timpani_production)
        
        let snareRead_rhythm = aDecoder.decodeInteger(forKey: propertyKey.snareRead_rhythm)
        let snareRead_production = aDecoder.decodeInteger(forKey: propertyKey.snareRead_production)
        
        let malletRead_rhythm = aDecoder.decodeInteger(forKey: propertyKey.malletRead_rhythm)
        let malletRead_pitch = aDecoder.decodeInteger(forKey: propertyKey.malletRead_pitch)
        let malletRead_production = aDecoder.decodeInteger(forKey: propertyKey.malletRead_production)
        
        let finalScore = aDecoder.decodeInteger(forKey: propertyKey.finalScore)
        
        self.init(first_name: first_name, last_name: last_name as! String, instrument: instrument as! String, comments: comments as! String, scale1_pitch: scale1_pitch, scale1_production: scale1_production, scale2_pitch: scale2_pitch, scale2_production: scale2_production, scale3_pitch: scale3_pitch, scale3_production: scale3_production, snare_rhythm: snare_rhythm, snare_tempo: snare_tempo, snare_dynamic: snare_dynamic, snare_production: snare_production, mallet_rhythm: mallet_rhythm, mallet_pitch: mallet_pitch, mallet_tempo: mallet_tempo, mallet_dynamic: mallet_dynamic, mallet_production: mallet_production, timpani_rhythm: timpani_rhythm, timpani_tempo: timpani_tempo, timpani_dynamic: timpani_dynamic, timpani_production: timpani_production, snareRead_rhythm: snareRead_rhythm, snareRead_production: snareRead_production, malletRead_rhythm: malletRead_rhythm , malletRead_pitch: malletRead_pitch, malletRead_production: malletRead_production, finalScore: finalScore)
    }

}
