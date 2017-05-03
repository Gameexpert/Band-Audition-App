//
//  concertWinds.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 12/5/16.
//  Copyright © 2016 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

class concertWinds: NSObject, NSCoding, audition //Audition is the protocol
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
    
    var finalScoreDouble: Double
    var finalScore: Int //Necessary to comply with the protocol
    
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
        
        static var finalScoreDouble = "finalScoreDouble"
        static var finalScore = "finalScore"
    }
    
    init(other: concertWinds)
    {
        self.first_name = other.first_name
        self.last_name = other.last_name
        self.instrument = other.instrument
        self.concert_type = other.concert_type
        self.comments = other.comments
        self.memorized = other.memorized
        
        self.scale1 = other.scale1
        self.scale2 = other.scale2
        self.scale3 = other.scale3
        self.scale4 = other.scale4
        self.scale5 = other.scale5
        self.chromatic_scale = other.chromatic_scale
        
        self.etude1_pitch = other.etude1_pitch
        self.etude1_rhythm = other.etude1_rhythm
        self.etude1_articulation = other.etude1_articulation
        self.etude1_dynamics = other.etude1_dynamics
        self.etude1_tone = other.etude1_tone
        self.etude1_style = other.etude1_style
        
        self.etude2_pitch = other.etude2_pitch
        self.etude2_rhythm = other.etude2_rhythm
        self.etude2_articulation = other.etude2_articulation
        self.etude2_dynamics = other.etude2_dynamics
        self.etude2_tone = other.etude2_tone
        self.etude2_style = other.etude2_style
        
        self.read_pitch = other.read_pitch
        self.read_rhythm = other.read_rhythm
        self.finalScoreDouble = other.finalScoreDouble
        self.finalScore = other.finalScore
    }
    
    init(first_name: String, last_name: String, instrument: String, concert_type: String, comments: String, memorized: Bool, scale1: Double, scale2: Double, scale3: Double, scale4: Double, scale5: Double, chromatic_scale: Double, etude1_pitch: Double, etude1_rhythm: Double, etude1_articulation: Double, etude1_dynamics: Double, etude1_tone: Double, etude1_style: Double, etude2_pitch: Double, etude2_rhythm: Double, etude2_articulation: Double, etude2_dynamics: Double, etude2_tone: Double, etude2_style: Double, read_pitch: Double, read_rhythm: Double, finalScoreDouble: Double)
    {
        self.first_name = first_name
        self.last_name = last_name
        self.instrument = instrument
        self.concert_type = concert_type
        self.comments = comments
        self.memorized = memorized
        
        self.scale1 = scale1
        self.scale2 = scale2
        self.scale3 = scale3
        self.scale4 = scale4
        self.scale5 = scale5
        self.chromatic_scale = chromatic_scale
        
        self.etude1_pitch = etude1_pitch
        self.etude1_rhythm = etude1_rhythm
        self.etude1_articulation = etude1_articulation
        self.etude1_dynamics = etude1_dynamics
        self.etude1_tone = etude1_tone
        self.etude1_style = etude1_style
        
        self.etude2_pitch = etude2_pitch
        self.etude2_rhythm = etude2_rhythm
        self.etude2_articulation = etude2_articulation
        self.etude2_dynamics = etude2_dynamics
        self.etude2_tone = etude2_tone
        self.etude2_style = etude2_style
        
        self.read_pitch = read_pitch
        self.read_rhythm = read_rhythm
        self.finalScoreDouble = finalScoreDouble
        self.finalScore = Int(finalScoreDouble * 10)
    }
    
    func encode (with aCoder: NSCoder)
    {
        aCoder.encode(first_name, forKey: propertyKey.first_name)
        aCoder.encode(last_name, forKey: propertyKey.last_name)
        aCoder.encode(instrument, forKey: propertyKey.instrument)
        aCoder.encode(concert_type, forKey: propertyKey.concert_type)
        aCoder.encode(comments, forKey: propertyKey.comments)
        aCoder.encode(memorized, forKey: propertyKey.memorized)
        
        aCoder.encode(scale1, forKey: propertyKey.scale1)
        aCoder.encode(scale2, forKey: propertyKey.scale2)
        aCoder.encode(scale3, forKey: propertyKey.scale3)
        aCoder.encode(scale4, forKey: propertyKey.scale4)
        aCoder.encode(scale5, forKey: propertyKey.scale5)
        aCoder.encode(chromatic_scale, forKey: propertyKey.chromatic_scale)
        
        aCoder.encode(etude1_pitch, forKey: propertyKey.etude1_pitch)
        aCoder.encode(etude1_rhythm, forKey: propertyKey.etude1_rhythm)
        aCoder.encode(etude1_articulation, forKey: propertyKey.etude1_articulation)
        aCoder.encode(etude1_dynamics, forKey: propertyKey.etude1_dynamics)
        aCoder.encode(etude1_tone, forKey: propertyKey.etude1_tone)
        aCoder.encode(etude1_style, forKey: propertyKey.etude1_style)
        
        aCoder.encode(etude2_pitch, forKey: propertyKey.etude2_pitch)
        aCoder.encode(etude2_rhythm, forKey: propertyKey.etude2_rhythm)
        aCoder.encode(etude2_articulation, forKey: propertyKey.etude2_articulation)
        aCoder.encode(etude2_dynamics, forKey: propertyKey.etude2_dynamics)
        aCoder.encode(etude2_tone, forKey: propertyKey.etude2_tone)
        aCoder.encode(etude2_style, forKey: propertyKey.etude2_style)
        
        aCoder.encode(read_pitch, forKey: propertyKey.read_pitch)
        aCoder.encode(read_rhythm, forKey: propertyKey.read_rhythm)
        
        aCoder.encode(finalScoreDouble, forKey: propertyKey.finalScoreDouble)
        aCoder.encode(finalScore, forKey: propertyKey.finalScore)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        //The name is required. If we cannot decode a name string, the initializer should fail
        
        guard let first_name = aDecoder.decodeObject(forKey: propertyKey.first_name) as? String else {
            os_log("Unable to decode the name for a concertWinds object.", log: OSLog.default, type: .debug)
            return nil
        }
        let last_name = aDecoder.decodeObject(forKey: propertyKey.last_name)
        let instrument = aDecoder.decodeObject(forKey: propertyKey.instrument)
        let concert_type = aDecoder.decodeObject(forKey: propertyKey.concert_type)
        let comments = aDecoder.decodeObject(forKey: propertyKey.comments)
        let memorized = aDecoder.decodeBool(forKey: propertyKey.memorized)
        
        let scale1 = aDecoder.decodeDouble(forKey: propertyKey.scale1)
        let scale2 = aDecoder.decodeDouble(forKey: propertyKey.scale2)
        let scale3 = aDecoder.decodeDouble(forKey: propertyKey.scale3)
        let scale4 = aDecoder.decodeDouble(forKey: propertyKey.scale4)
        let scale5 = aDecoder.decodeDouble(forKey: propertyKey.scale5)
        let chromatic_scale = aDecoder.decodeDouble(forKey: propertyKey.chromatic_scale)
        
        let etude1_pitch = aDecoder.decodeDouble(forKey: propertyKey.etude1_pitch)
        let etude1_rhythm = aDecoder.decodeDouble(forKey: propertyKey.etude1_rhythm)
        let etude1_articulation = aDecoder.decodeDouble(forKey: propertyKey.etude1_articulation)
        let etude1_dynamics = aDecoder.decodeDouble(forKey: propertyKey.etude1_dynamics)
        let etude1_tone = aDecoder.decodeDouble(forKey: propertyKey.etude1_tone)
        let etude1_style = aDecoder.decodeDouble(forKey: propertyKey.etude1_style)
        
        let etude2_pitch = aDecoder.decodeDouble(forKey: propertyKey.etude2_pitch)
        let etude2_rhythm = aDecoder.decodeDouble(forKey: propertyKey.etude2_rhythm)
        let etude2_articulation = aDecoder.decodeDouble(forKey: propertyKey.etude2_articulation)
        let etude2_dynamics = aDecoder.decodeDouble(forKey: propertyKey.etude2_dynamics)
        let etude2_tone = aDecoder.decodeDouble(forKey: propertyKey.etude2_tone)
        let etude2_style = aDecoder.decodeDouble(forKey: propertyKey.etude2_style)
        
        let read_pitch = aDecoder.decodeDouble(forKey: propertyKey.read_pitch)
        let read_rhythm = aDecoder.decodeDouble(forKey: propertyKey.read_rhythm)
        let finalScoreDouble = aDecoder.decodeDouble(forKey: propertyKey.finalScoreDouble)
        
        self.init(first_name: first_name, last_name: last_name as! String, instrument: instrument as! String, concert_type: concert_type as! String, comments: comments as! String, memorized: memorized, scale1: scale1, scale2: scale2, scale3: scale3, scale4: scale4, scale5: scale5, chromatic_scale: chromatic_scale, etude1_pitch: etude1_pitch, etude1_rhythm: etude1_rhythm, etude1_articulation: etude1_articulation, etude1_dynamics: etude1_dynamics, etude1_tone: etude1_tone, etude1_style: etude1_style, etude2_pitch: etude2_pitch, etude2_rhythm: etude2_rhythm, etude2_articulation: etude2_articulation, etude2_dynamics: etude2_dynamics, etude2_tone: etude2_tone, etude2_style: etude2_style, read_pitch: read_pitch, read_rhythm: read_rhythm, finalScoreDouble: finalScoreDouble)
    }
}
