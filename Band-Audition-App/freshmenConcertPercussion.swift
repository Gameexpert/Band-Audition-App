//
//  freshmenConcertPercussion.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

class freshmenConcertPercussion: NSObject, NSCoding, audition  //Audition is the protocol
{
    //MARK: Properties
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
    var mallet_pitch: Int
    var mallet_tempo: Int
    var mallet_dynamic: Int
    var mallet_production: Int
    
    var snareRead_rhythm: Int
    var snareRead_production: Int
    
    var malletRead_rhythm: Int
    var malletRead_pitch: Int
    var malletRead_production: Int
    
    var finalScore: Int
    
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("FreshmenConcertAuditions")
    
    //MARK: Types
    struct PropertyKey
    {
        static var first_name = "first_name"
        static var last_name = "last_name"
        static var instrument = "instrument"
        static var comments = "comments"
        
        static var scale1_pitch = "scale1_pitch"
        static var scale1_production = "scale1_production"
        static var scale2_pitch = "scale2_pitch"
        static var scale2_production = "scale2_production"
        
        static var snare_rhythm = "snare_rhythm"
        static var snare_tempo = "snare_tempo"
        static var snare_dynamic = "snare_dynamic"
        static var snare_production = "snare_production"
        
        static var mallet_rhythm = "mallet_rhythm"
        static var mallet_pitch = "mallet_pitch"
        static var mallet_tempo = "mallet_tempo"
        static var mallet_dynamic = "mallet_dynamic"
        static var mallet_production = "mallet_production"
        
        static var snareRead_rhythm = "snareRead_rhythm"
        static var snareRead_production = "snareRead_production"
        
        static var malletRead_rhythm = "malletRead_rhythm"
        static var malletRead_pitch = "malletRead_pitch"
        static var malletRead_production = "malletRead_production"
        
        static var finalScore = "finalScore"
    }
   
/*
    init(instrument: String, firstname: String)
    {
        self.first_name = firstname
        self.last_name = ""
        self.instrument = instrument
        self.comments = ""
        
        self.scale1_pitch = 0
        self.scale1_production = 0
        self.scale2_pitch = 0
        self.scale2_production = 0
        
        self.snare_rhythm = 0
        self.snare_tempo = 0
        self.snare_dynamic = 0
        self.snare_production = 0
        
        self.mallet_rhythm = 0
        self.mallet_pitch = 0
        self.mallet_tempo = 0
        self.mallet_dynamic = 0
        self.mallet_production = 0
        
        self.snareRead_rhythm = 0
        self.snareRead_production = 0
        
        self.malletRead_rhythm = 0
        self.malletRead_pitch = 0
        self.malletRead_production = 0
        
        self.finalScore = 0
    }
 */
    
    init(first_name: String, last_name: String, instrument: String, comments: String, scale1_pitch: Int, scale1_production: Int, scale2_pitch: Int, scale2_production: Int, snare_rhythm: Int, snare_tempo: Int, snare_dynamic: Int, snare_production: Int, mallet_rhythm: Int, mallet_pitch: Int, mallet_tempo: Int, mallet_dynamic: Int, mallet_production: Int, snareRead_rhythm: Int, snareRead_production: Int, malletRead_rhythm: Int, malletRead_pitch: Int, malletRead_production: Int, finalScore: Int)
    {
        self.first_name = first_name
        self.last_name = last_name
        self.instrument = instrument
        self.comments = comments
        
        self.scale1_pitch = scale1_pitch
        self.scale1_production = scale1_production
        self.scale2_pitch = scale2_pitch
        self.scale2_production = scale2_production
        
        self.snare_rhythm = snare_rhythm
        self.snare_tempo = snare_tempo
        self.snare_dynamic = snare_dynamic
        self.snare_production = snare_production
        
        self.mallet_rhythm = mallet_rhythm
        self.mallet_pitch = mallet_pitch
        self.mallet_tempo = mallet_tempo
        self.mallet_dynamic = mallet_dynamic
        self.mallet_production = mallet_production
        
        self.snareRead_rhythm = snareRead_rhythm
        self.snareRead_production = snareRead_production
        
        self.malletRead_rhythm = malletRead_rhythm
        self.malletRead_pitch = malletRead_pitch
        self.malletRead_production = malletRead_production
        
        self.finalScore = finalScore
    }
    
    
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(first_name, forKey: PropertyKey.first_name)
        aCoder.encode(last_name, forKey: PropertyKey.last_name)
        aCoder.encode(instrument, forKey: PropertyKey.instrument)
        aCoder.encode(comments, forKey: PropertyKey.comments)
        
        aCoder.encode(scale1_pitch, forKey: PropertyKey.scale1_pitch)
        aCoder.encode(scale1_production, forKey: PropertyKey.scale1_production)
        aCoder.encode(scale2_pitch, forKey: PropertyKey.scale2_pitch)
        aCoder.encode(scale2_production, forKey: PropertyKey.scale2_production)
        
        aCoder.encode(snare_rhythm, forKey: PropertyKey.snare_rhythm)
        aCoder.encode(snare_tempo, forKey: PropertyKey.snare_tempo)
        aCoder.encode(snare_dynamic, forKey: PropertyKey.snare_dynamic)
        aCoder.encode(snare_production, forKey: PropertyKey.snare_production)
        
        aCoder.encode(mallet_rhythm, forKey: PropertyKey.mallet_rhythm)
        aCoder.encode(mallet_pitch, forKey: PropertyKey.mallet_pitch)
        aCoder.encode(mallet_tempo, forKey: PropertyKey.mallet_tempo)
        aCoder.encode(mallet_dynamic, forKey: PropertyKey.mallet_dynamic)
        aCoder.encode(mallet_production, forKey: PropertyKey.mallet_production)
        
        aCoder.encode(snareRead_rhythm, forKey: PropertyKey.snareRead_rhythm)
        aCoder.encode(snareRead_production, forKey: PropertyKey.snareRead_production)
        
        aCoder.encode(malletRead_rhythm, forKey: PropertyKey.malletRead_rhythm)
        aCoder.encode(malletRead_pitch, forKey: PropertyKey.malletRead_pitch)
        aCoder.encode(malletRead_production, forKey: PropertyKey.malletRead_production)
        
        aCoder.encode(finalScore, forKey: PropertyKey.finalScore)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let first_name = aDecoder.decodeObject(forKey: PropertyKey.first_name) as? String else
        {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let last_name = aDecoder.decodeObject(forKey: PropertyKey.last_name)
        let instrument = aDecoder.decodeObject(forKey: PropertyKey.instrument)
        let comments = aDecoder.decodeObject(forKey: PropertyKey.comments)
        
        let scale1_pitch = aDecoder.decodeInteger(forKey: PropertyKey.scale1_pitch)
        let scale1_production = aDecoder.decodeInteger(forKey: PropertyKey.scale1_production)
        let scale2_pitch = aDecoder.decodeInteger(forKey: PropertyKey.scale2_pitch)
        let scale2_production = aDecoder.decodeInteger(forKey: PropertyKey.scale2_production)
        
        let snare_rhythm = aDecoder.decodeInteger(forKey: PropertyKey.snare_rhythm)
        let snare_tempo = aDecoder.decodeInteger(forKey: PropertyKey.snare_tempo)
        let snare_dynamic = aDecoder.decodeInteger(forKey: PropertyKey.snare_dynamic)
        let snare_production = aDecoder.decodeInteger(forKey: PropertyKey.snare_production)
        
        let mallet_rhythm = aDecoder.decodeInteger(forKey: PropertyKey.mallet_rhythm)
        let mallet_pitch = aDecoder.decodeInteger(forKey: PropertyKey.mallet_pitch)
        let mallet_tempo = aDecoder.decodeInteger(forKey: PropertyKey.mallet_tempo)
        let mallet_dynamic = aDecoder.decodeInteger(forKey: PropertyKey.mallet_dynamic)
        let mallet_production = aDecoder.decodeInteger(forKey: PropertyKey.mallet_production)
        
        let snareRead_rhythm = aDecoder.decodeInteger(forKey: PropertyKey.snareRead_rhythm)
        let snareRead_production = aDecoder.decodeInteger(forKey: PropertyKey.snareRead_production)
        
        let malletRead_rhythm = aDecoder.decodeInteger(forKey: PropertyKey.malletRead_rhythm)
        let malletRead_pitch = aDecoder.decodeInteger(forKey: PropertyKey.malletRead_pitch)
        let malletRead_production = aDecoder.decodeInteger(forKey: PropertyKey.malletRead_production)
        
        let finalScore = aDecoder.decodeInteger(forKey: PropertyKey.finalScore)
        
        self.init(first_name: first_name, last_name: last_name as! String, instrument: instrument as! String, comments: comments as! String, scale1_pitch: scale1_pitch , scale1_production: scale1_production as! Int, scale2_pitch: scale2_pitch as! Int, scale2_production: scale2_production as! Int, snare_rhythm: snare_rhythm as! Int, snare_tempo: snare_tempo as! Int, snare_dynamic: snare_dynamic as! Int, snare_production: snare_production as! Int, mallet_rhythm: mallet_rhythm as! Int, mallet_pitch: mallet_pitch as! Int, mallet_tempo: mallet_tempo as! Int, mallet_dynamic: mallet_dynamic as! Int, mallet_production: mallet_production as! Int, snareRead_rhythm: snareRead_rhythm as! Int, snareRead_production: snareRead_production as! Int, malletRead_rhythm: malletRead_rhythm as! Int, malletRead_pitch: malletRead_pitch as! Int, malletRead_production: malletRead_production as! Int, finalScore: finalScore as! Int)
    }
}
