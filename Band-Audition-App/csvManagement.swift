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
                        csvText = "Varsity Concert Winds\n,Instrument, Last Name, First Name, Final Score, Comments, Scale 1, Scale 2, Scale 3, Scale 4, Scale 5, Chromatic Scale, Etude 1: Pitch, Etude 1: Rhythm, Etude 1:Articulation, Etude 1: Dynamics, Etude 1: Tone, Etude 1: Style, Etude 2: Pitch, Etude 2: Rhythm, Etude 2: Articulation, Etude 2: Dynamics, Etude 2: Tone, Etude 2: Style, Sight Read: Pitch, Sight Read: Rhythm\n"
                        
                        let newLine = "\(rhythm.instrument), \(rhythm.last_name), \(rhythm.first_name), \(rhythm.finalScore), \(rhythm.comments), \(rhythm.scale1), \(rhythm.scale2), \(rhythm.scale3), \(rhythm.scale4), \(rhythm.scale5), \(rhythm.chromatic_scale), \(rhythm.etude1_pitch), \(rhythm.etude1_rhythm), \(rhythm.etude1_articulation), \(rhythm.etude1_dynamics), \(rhythm.etude1_tone), \(rhythm.etude1_style),  \(rhythm.etude2_pitch), \(rhythm.etude2_rhythm), \(rhythm.etude2_articulation), \(rhythm.etude2_dynamics), \(rhythm.etude2_tone), \(rhythm.etude2_style), \(rhythm.read_pitch), \(rhythm.read_rhythm)\n"
                        csvText.append(newLine)
                        
                    }
                }
                for x in 0..<auditionsToConvert.count
                {
                    if let percussion = auditionsToConvert[x] as? varsityConcertPercussion
                    {
                        csvText.append("\nVarsity Concert Percussion\n, Instrument, Last Name, First Name, Final Score, Comments, Scale 1: Pitch, Scale 1: Production,  Scale 2: Pitch,  Scale 2: Production,  Scale 3: Pitch,  Scale 3: Production, Snare: Rhythm, Snare: Tempo, Snare: Dynamic, Snare: Production, Mallet: Rhythm, Mallet: Pitch, Mallet: Tempo, Mallet: Dynamic, Mallet: Production, Timpani: Rhythm, Timpani: Tempo,  Timpani: Dynamic,  Timpani: Production, Snare Reading: Rhythm, Snare Reading: Production, Mallet Reading: Rhythm, Mallet Reading: Pitch, Mallet Reading: Production\n")
                        
                        let newLine = "\(percussion.instrument), \(percussion.last_name), \(percussion.first_name), \(percussion.finalScore), \(percussion.comments), \(percussion.scale1_pitch), \(percussion.scale1_production), \(percussion.scale2_pitch), \(percussion.scale2_production), \(percussion.scale3_pitch), \(percussion.scale3_production), \(percussion.snare_rhythm), \(percussion.snare_tempo), \(percussion.snare_dynamic), \(percussion.snare_production), \(percussion.mallet_rhythm), \(percussion.mallet_pitch),  \(percussion.mallet_tempo), \(percussion.mallet_dynamic), \(percussion.mallet_production), \(percussion.timpani_rhythm), \(percussion.timpani_tempo), \(percussion.timpani_dynamic), \(percussion.timpani_production), \(percussion.snareRead_rhythm), \(percussion.snareRead_production), \(percussion.malletRead_rhythm), \(percussion.malletRead_pitch), \(percussion.malletRead_production)\n"
                        csvText.append(newLine)
                    }
                }
            }
            do {
                try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to create file")
                print("\(error)")
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
