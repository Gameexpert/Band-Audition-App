//
//  jazzRhythms.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 3/14/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

class jazzRhythms: NSObject, NSCoding, audition
{
    var first_name: String
    var last_name: String
    var preferredRange: String
    var instrument: String
    var comments: String
    
    var swing_Production: Int
    var swing_Rhythm: Int
    var swing_Articulations: Int
    
    var straight_Production: Int
    var straight_Rhythm: Int
    var straight_Articulations: Int
    
    var sight_Production: Int
    var sight_Rhythm: Int
    var sight_Articulations: Int
    
    var improvisation: Int
    var leftHand_Independence: Int
    
    var finalScore: Int
    
    struct PropertyKey
    {
        static var first_name = "first_name"
        static var last_name = "last_name"
        static var preferredRange = "preferredRange"
        static var instrument = "instrument"
        static var comments = "comments"
        
        static var swing_Production = "swing_Production"
        static var swing_Rhythm = "swing_Rhythm"
        static var swing_Articulations = "swing_Articulations"
        
        static var straight_Production = "straight_Production"
        static var straight_Rhythm = "straight_Rhythm"
        static var straight_Articulations = "straight_Articulations"
        
        static var sight_Production = "sight_Production"
        static var sight_Rhythm = "sight_Rhythm"
        static var sight_Articulations = "sight_Articulations"
        
        static var improvisation = "improvisation"
        static var leftHand_Independence = "leftHand_Independence"
        
        static var finalScore = "finalScore"
    }
    
    init(_ other: jazzRhythms)
    {
        self.first_name = other.first_name
        self.last_name = other.last_name
        self.preferredRange = other.preferredRange
        self.instrument = other.instrument
        self.comments = other.comments
        
        self.swing_Production = other.swing_Production
        self.swing_Rhythm = other.swing_Rhythm
        self.swing_Articulations = other.swing_Articulations
        
        self.straight_Production = other.straight_Production
        self.straight_Rhythm = other.straight_Rhythm
        self.straight_Articulations = other.straight_Articulations
        
        self.sight_Production = other.sight_Production
        self.sight_Rhythm = other.sight_Rhythm
        self.sight_Articulations = other.sight_Articulations
        
        self.improvisation = other.improvisation
        self.leftHand_Independence = other.leftHand_Independence
        
        self.finalScore = other.finalScore
    }
    
    init(first_name: String, last_name: String, preferredRange: String, instrument: String, comments: String, swing_Production: Int, swing_Rhythm: Int, swing_Articulations: Int, straight_Production: Int, straight_Rhythm: Int, straight_Articulations: Int, sight_Production: Int, sight_Rhythm: Int, sight_Articulations: Int, improvisation: Int, leftHand_Independence: Int, finalScore: Int)
    {
        self.first_name = first_name
        self.last_name = last_name
        self.preferredRange = preferredRange
        self.instrument = instrument
        self.comments = comments
        
        self.swing_Production = swing_Production
        self.swing_Rhythm = swing_Rhythm
        self.swing_Articulations = swing_Articulations
        
        self.straight_Production = straight_Production
        self.straight_Rhythm = straight_Rhythm
        self.straight_Articulations = straight_Articulations
        
        self.sight_Production = sight_Production
        self.sight_Rhythm = sight_Rhythm
        self.sight_Articulations = sight_Articulations
        
        self.improvisation = improvisation
        self.leftHand_Independence = leftHand_Independence
        
        self.finalScore = finalScore
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(first_name, forKey: PropertyKey.first_name)
        aCoder.encode(last_name, forKey: PropertyKey.last_name)
        aCoder.encode(preferredRange, forKey: PropertyKey.preferredRange)
        aCoder.encode(instrument, forKey: PropertyKey.instrument)
        aCoder.encode(comments, forKey: PropertyKey.comments)
        
        aCoder.encode(swing_Production, forKey: PropertyKey.swing_Production)
        aCoder.encode(swing_Rhythm, forKey: PropertyKey.swing_Rhythm)
        aCoder.encode(swing_Articulations, forKey: PropertyKey.swing_Articulations)
        
        aCoder.encode(straight_Production, forKey: PropertyKey.straight_Production)
        aCoder.encode(straight_Rhythm, forKey: PropertyKey.straight_Rhythm)
        aCoder.encode(straight_Articulations, forKey: PropertyKey.straight_Articulations)
        
        aCoder.encode(sight_Production, forKey: PropertyKey.sight_Production)
        aCoder.encode(sight_Rhythm, forKey: PropertyKey.sight_Rhythm)
        aCoder.encode(sight_Articulations, forKey: PropertyKey.sight_Articulations)
        
        aCoder.encode(improvisation, forKey: PropertyKey.improvisation)
        aCoder.encode(leftHand_Independence, forKey: PropertyKey.leftHand_Independence)
        
        aCoder.encode(finalScore, forKey: PropertyKey.finalScore)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let first_name = aDecoder.decodeObject(forKey: PropertyKey.first_name) as? String else
        {
            os_log("Unable to decode the name for Jazz Drumset object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let last_name = aDecoder.decodeObject(forKey: PropertyKey.last_name)
        let preferredRange = aDecoder.decodeObject(forKey: PropertyKey.preferredRange)
        let instrument = aDecoder.decodeObject(forKey: PropertyKey.instrument)
        let comments = aDecoder.decodeObject(forKey: PropertyKey.comments)
        
        let swing_Production = aDecoder.decodeInteger(forKey: PropertyKey.swing_Production)
        let swing_Rhythm = aDecoder.decodeInteger(forKey: PropertyKey.swing_Rhythm)
        let swing_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.swing_Articulations)
        
        let straight_Production = aDecoder.decodeInteger(forKey: PropertyKey.straight_Production)
        let straight_Rhythm = aDecoder.decodeInteger(forKey: PropertyKey.straight_Rhythm)
        let straight_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.straight_Articulations)
        
        let sight_Production = aDecoder.decodeInteger(forKey: PropertyKey.sight_Production)
        let sight_Rhythm = aDecoder.decodeInteger(forKey: PropertyKey.sight_Rhythm)
        let sight_Articulations = aDecoder.decodeInteger(forKey: PropertyKey.sight_Articulations)
        
        let improvisation = aDecoder.decodeInteger(forKey: PropertyKey.improvisation)
        let leftHand_Independence = aDecoder.decodeInteger(forKey: PropertyKey.leftHand_Independence)
        
        let finalScore = aDecoder.decodeInteger(forKey: PropertyKey.finalScore)
        
        self.init(first_name: first_name, last_name: last_name as! String, preferredRange: preferredRange as! String, instrument: instrument as! String, comments: comments as! String, swing_Production: swing_Production , swing_Rhythm: swing_Rhythm , swing_Articulations: swing_Articulations , straight_Production: straight_Production , straight_Rhythm: straight_Rhythm , straight_Articulations: straight_Articulations , sight_Production: sight_Production , sight_Rhythm: sight_Rhythm , sight_Articulations: sight_Articulations , improvisation: improvisation , leftHand_Independence: leftHand_Independence , finalScore: finalScore )
    }

}
