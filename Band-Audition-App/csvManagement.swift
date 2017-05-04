//
//  csvManagement.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 5/3/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit
import MessageUI

class csvManagement: NSObject
{
    //MARK: Functions
    class func createCSV() -> Void
    {
        let fileName = "Auditions.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = ""
        
        var auditionsToConvert: [audition] = []
        switch arrayIdentifier
        {
        case 0://Varsity
            for x in 0..<varsityAuditions.count
            {
                for i in 0..<varsityAuditions[x].count
                {
                    auditionsToConvert.append(varsityAuditions[x][i])
                }
                
                for x in 0..<auditionsToConvert.count
                {
                    if let rhythm = auditionsToConvert[x] as? concertWinds
                    {
                        csvText = "Last Name, First Name, Instrument, Comments, Scale 1, Scale 2, Scale 3, Scale 4, Scale 5, Chromatic Scale, Etude 1: Pitch, Etude 1: Rhythm, Etude 1:Articulation, Etude 1: Dynamics, Etude 1: Tone, Etude 1: Style, Etude 2: Pitch, Etude 2: Rhythm, Etude 2: Articulation, Etude 2: Dynamics, Etude 2: Tone, Etude 2: Style, Sight Read: Pitch, Sight Read: Rhythm, Final Score"
                    }
                }
            }
        case 1: //Freshmen
            for x in 0..<freshmenAuditions.count
            {
                for i in 0..<freshmenAuditions[x].count
                {
                    auditionsToConvert.append(freshmenAuditions[x][i])
                }
            }
        case 2: //Jazz
            for x in 0..<jazzAuditions.count
            {
                for i in 0..<jazzAuditions[x].count
                {
                    auditionsToConvert.append(jazzAuditions[x][i])
                }
            }
        default:
            Swift.print("Default Case in updateArrayValues called, arrayIdentifier = \(arrayIdentifier)")
        }
    }
}
