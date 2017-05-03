//
//  jazzDrumset.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 2/28/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

class jazzDrumset: NSObject, NSCoding, audition //Audition is the protocol
{
    var first_name: String
    var last_name: String
    var instrument: String
    var comments: String
    
    var swing_Support: Int
    var swing_Stability: Int
    var swing_Articulations: Int
    
    var straight_Support: Int
    var straight_Stability: Int
    var straight_Articulations: Int
    
    var sight_Support: Int
    var sight_Stability: Int
    var sight_Articulations: Int
    
    var improvisation: Int
    var leftHand_Independence: Int
    
    var finalScore: Int
    
    struct PropertyKey
    {
        static var first_name = "first_name"
        static var last_name = "last_name"
        static var instrument = "instrument"
        static var comments = "comments"
        
        static var swing_Support = "swing_Support"
        static var swing_Stability = "swing_Stability"
        static var swing_Articulations = "swing_Articulations"
        
        static var straight_Support = "straight_Support"
        static var straight_Stability = "straight_Stability"
        static var straight_Articulations = "straight_Articulations"
        
        static var sight_Support = "sight_Support"
        static var sight_Stability = "sight_Stability"
        static var sight_Articulations = "sight_Articulations"
        
        static var improvisation = "improvisation"
        static var leftHand_Independence = "leftHand_Independence"
        
        static var finalScore = "finalScore"
    }
    
    init(other: jazzDrumset)
    {
        self.first_name = other.first_name
        self.last_name = other.last_name
        self.instrument = other.instrument
        self.comments = other.comments
        
        self.swing_Support = other.swing_Support
        self.swing_Stability = other.swing_Stability
        self.swing_Articulations = other.swing_Articulations
        
        self.straight_Support = other.straight_Support
        self.straight_Stability = other.straight_Stability
        self.straight_Articulations = other.straight_Articulations
        
        self.sight_Support = other.sight_Support
        self.sight_Stability = other.sight_Stability
        self.sight_Articulations = other.sight_Articulations
        
        self.improvisation = other.improvisation
        self.leftHand_Independence = other.leftHand_Independence
        
        self.finalScore = other.finalScore
    }
    
    init(first_name: String, last_name: String, instrument: String, comments: String, swing_Support: Int, swing_Stability: Int, swing_Articulations: Int, straight_Support: Int, straight_Stability: Int, straight_Articulations: Int, sight_Support: Int, sight_Stability: Int, sight_Articulations: Int, improvisation: Int, leftHand_Independence: Int, finalScore: Int)
    {
        self.first_name = first_name
        self.last_name = last_name
        self.instrument = instrument
        self.comments = comments
        
        self.swing_Support = swing_Support
        self.swing_Stability = swing_Stability
        self.swing_Articulations = swing_Articulations
        
        self.straight_Support = straight_Support
        self.straight_Stability = straight_Stability
        self.straight_Articulations = straight_Articulations
        
        self.sight_Support = sight_Support
        self.sight_Stability = sight_Stability
        self.sight_Articulations = sight_Articulations
        
        self.improvisation = improvisation
        self.leftHand_Independence = leftHand_Independence
        
        self.finalScore = finalScore
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(first_name, forKey: PropertyKey.first_name)
        aCoder.encode(last_name, forKey: PropertyKey.last_name)
        aCoder.encode(instrument, forKey: PropertyKey.instrument)
        aCoder.encode(comments, forKey: PropertyKey.comments)
        
        aCoder.encode(swing_Support, forKey: PropertyKey.swing_Support)
        aCoder.encode(swing_Stability, forKey: PropertyKey.swing_Stability)
        aCoder.encode(swing_Articulations, forKey: PropertyKey.swing_Articulations)
        
        aCoder.encode(straight_Support, forKey: PropertyKey.straight_Support)
        aCoder.encode(straight_Stability, forKey: PropertyKey.straight_Stability)
        aCoder.encode(straight_Articulations, forKey: PropertyKey.straight_Articulations)
        
        aCoder.encode(sight_Support, forKey: PropertyKey.sight_Support)
        aCoder.encode(sight_Stability, forKey: PropertyKey.sight_Stability)
        aCoder.encode(sight_Articulations, forKey: PropertyKey.sight_Articulations)
        
        aCoder.encode(improvisation, forKey: PropertyKey.improvisation)
        aCoder.encode(leftHand_Independence, forKey: PropertyKey.leftHand_Independence)
        
        aCoder.encode(finalScore, forKey: PropertyKey.finalScore)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let first_name = aDecoder.decodeObject(forKey: PropertyKey.first_name) as? String else
        {
            os_log("Unable to decode the name for Jazz Drumset object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let last_name = aDecoder.decodeObject(forKey: PropertyKey.last_name)
        let instrument = aDecoder.decodeObject(forKey: PropertyKey.instrument)
        let comments = aDecoder.decodeObject(forKey: PropertyKey.comments)
        
        let swing_Support = aDecoder.decodeInteger(forKey: PropertyKey.swing_Support)
        let swing_Stability = aDecoder.decodeInteger(forKey: PropertyKey.swing_Stability)
        let swing_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.swing_Articulations)
        
        let straight_Support = aDecoder.decodeInteger(forKey: PropertyKey.straight_Support)
        let straight_Stability = aDecoder.decodeInteger(forKey: PropertyKey.straight_Stability)
        let straight_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.straight_Articulations)
        
        let sight_Support = aDecoder.decodeInteger(forKey: PropertyKey.sight_Support)
        let sight_Stability = aDecoder.decodeInteger(forKey: PropertyKey.sight_Stability)
        let sight_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.sight_Articulations)
        
        let improvisation = aDecoder.decodeInteger(forKey: PropertyKey.improvisation)
        let leftHand_Independence = aDecoder.decodeInteger(forKey: PropertyKey.leftHand_Independence)
        
        let finalScore = aDecoder.decodeInteger(forKey: PropertyKey.finalScore)
        
        self.init(first_name: first_name, last_name: last_name as! String, instrument: instrument as! String, comments: comments as! String, swing_Support: swing_Support as! Int, swing_Stability: swing_Stability as! Int, swing_Articulations: swing_Articulations as! Int, straight_Support: straight_Support as! Int, straight_Stability: straight_Stability as! Int, straight_Articulations: straight_Articulations as! Int, sight_Support: sight_Support as! Int, sight_Stability: sight_Stability as! Int, sight_Articulations: sight_Articulations as! Int, improvisation: improvisation as! Int, leftHand_Independence: leftHand_Independence as! Int, finalScore: finalScore as! Int)
    }
    
    
}
