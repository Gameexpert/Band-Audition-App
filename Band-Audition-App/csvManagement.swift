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
        var csvText = ""
        
        var firstInstance: Bool = true
        
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
            }
            for x in 0..<auditionsToConvert.count
            {
                if let rhythm = auditionsToConvert[x] as? concertWinds
                {
                    if firstInstance
                    {
                        csvText = "Varsity Concert Winds\n, \nInstrument, Last Name, First Name, Final Score, Comments, Scale 1, Scale 2, Scale 3, Scale 4, Scale 5, Chromatic Scale, Etude 1: Pitch, Etude 1: Rhythm, Etude 1:Articulation, Etude 1: Dynamics, Etude 1: Tone, Etude 1: Style, Etude 2: Pitch, Etude 2: Rhythm, Etude 2: Articulation, Etude 2: Dynamics, Etude 2: Tone, Etude 2: Style, Sight Read: Pitch, Sight Read: Rhythm\n"
                        firstInstance = false
                    }
                        
                    let newLine = "\(rhythm.instrument), \(rhythm.last_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.first_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.finalScoreDouble), \(rhythm.comments.replacingOccurrences(of: ",", with: ";")), \(rhythm.scale1), \(rhythm.scale2), \(rhythm.scale3), \(rhythm.scale4), \(rhythm.scale5), \(rhythm.chromatic_scale), \(rhythm.etude1_pitch), \(rhythm.etude1_rhythm), \(rhythm.etude1_articulation), \(rhythm.etude1_dynamics), \(rhythm.etude1_tone), \(rhythm.etude1_style),  \(rhythm.etude2_pitch), \(rhythm.etude2_rhythm), \(rhythm.etude2_articulation), \(rhythm.etude2_dynamics), \(rhythm.etude2_tone), \(rhythm.etude2_style), \(rhythm.read_pitch), \(rhythm.read_rhythm)\n"
                        csvText.append(newLine)
                        
                }
            }
            firstInstance = true
            for x in 0..<auditionsToConvert.count
            {
                if let percussion = auditionsToConvert[x] as? varsityConcertPercussion
                {
                    if firstInstance
                    {
                        csvText.append("\nVarsity Concert Percussion\n, \nInstrument, Last Name, First Name, Final Score, Comments, Scale 1: Pitch, Scale 1: Production,  Scale 2: Pitch,  Scale 2: Production,  Scale 3: Pitch,  Scale 3: Production, Snare: Rhythm, Snare: Tempo, Snare: Dynamic, Snare: Production, Mallet: Rhythm, Mallet: Pitch, Mallet: Tempo, Mallet: Dynamic, Mallet: Production, Timpani: Rhythm, Timpani: Tempo,  Timpani: Dynamic,  Timpani: Production, Snare Reading: Rhythm, Snare Reading: Production, Mallet Reading: Rhythm, Mallet Reading: Pitch, Mallet Reading: Production\n")
                        firstInstance = false
                    }
                        
                    let newLine = "\(percussion.instrument), \(percussion.last_name.replacingOccurrences(of: ",", with: ";")), \(percussion.first_name.replacingOccurrences(of: ",", with: ";")), \(percussion.finalScore), \(percussion.comments.replacingOccurrences(of: ",", with: ";")), \(percussion.scale1_pitch), \(percussion.scale1_production), \(percussion.scale2_pitch), \(percussion.scale2_production), \(percussion.scale3_pitch), \(percussion.scale3_production), \(percussion.snare_rhythm), \(percussion.snare_tempo), \(percussion.snare_dynamic), \(percussion.snare_production), \(percussion.mallet_rhythm), \(percussion.mallet_pitch),  \(percussion.mallet_tempo), \(percussion.mallet_dynamic), \(percussion.mallet_production), \(percussion.timpani_rhythm), \(percussion.timpani_tempo), \(percussion.timpani_dynamic), \(percussion.timpani_production), \(percussion.snareRead_rhythm), \(percussion.snareRead_production), \(percussion.malletRead_rhythm), \(percussion.malletRead_pitch), \(percussion.malletRead_production)\n"
                        csvText.append(newLine)
                }
            }
            
            do
            {
                try csvText.write(to: csvPath!, atomically: true, encoding: String.Encoding.utf8)
            }
            catch
            {
                print("Failed to create Varsity Auditions CSV")
            }
            
        case 1: //Freshmen
            for x in 0..<freshmenAuditions.count
            {
                for i in 0..<freshmenAuditions[x].count
                {
                    auditionsToConvert.append(freshmenAuditions[x][i])
                }
            }
            
            firstInstance = true
            for x in 0..<auditionsToConvert.count
            {
                if let rhythm = auditionsToConvert[x] as? concertWinds
                {
                    if firstInstance
                    {
                        csvText = "Freshmen Concert Winds\n, \nInstrument, Last Name, First Name, Final Score, Comments, Scale 1, Scale 2, Scale 3, Scale 4, Scale 5, Chromatic Scale, Etude 1: Pitch, Etude 1: Rhythm, Etude 1:Articulation, Etude 1: Dynamics, Etude 1: Tone, Etude 1: Style, Etude 2: Pitch, Etude 2: Rhythm, Etude 2: Articulation, Etude 2: Dynamics, Etude 2: Tone, Etude 2: Style, Sight Read: Pitch, Sight Read: Rhythm\n"
                        firstInstance = false
                    }
                    
                    
                    let newLine = "\(rhythm.instrument), \(rhythm.last_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.first_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.finalScoreDouble), \(rhythm.comments.replacingOccurrences(of: ",", with: ";")), \(rhythm.scale1), \(rhythm.scale2), \(rhythm.scale3), \(rhythm.scale4), \(rhythm.scale5), \(rhythm.chromatic_scale), \(rhythm.etude1_pitch), \(rhythm.etude1_rhythm), \(rhythm.etude1_articulation), \(rhythm.etude1_dynamics), \(rhythm.etude1_tone), \(rhythm.etude1_style),  \(rhythm.etude2_pitch), \(rhythm.etude2_rhythm), \(rhythm.etude2_articulation), \(rhythm.etude2_dynamics), \(rhythm.etude2_tone), \(rhythm.etude2_style), \(rhythm.read_pitch), \(rhythm.read_rhythm)\n"
                    csvText.append(newLine)
                    
                }
            }
            firstInstance = true
            for x in 0..<auditionsToConvert.count
            {
                if let percussion = auditionsToConvert[x] as? freshmenConcertPercussion
                {
                    if firstInstance
                    {
                        csvText.append("\nFreshmen Concert Percussion\n, \nInstrument, Last Name, First Name, Final Score, Comments, Scale 1: Pitch, Scale 1: Production,  Scale 2: Pitch,  Scale 2: Production, Snare: Rhythm, Snare: Tempo, Snare: Dynamic, Snare: Production, Mallet: Rhythm, Mallet: Pitch, Mallet: Tempo, Mallet: Dynamic, Mallet: Production, Snare Reading: Rhythm, Snare Reading: Production, Mallet Reading: Rhythm, Mallet Reading: Pitch, Mallet Reading: Production\n")
                        firstInstance = false
                    }
                    
                    
                    let newLine = "\(percussion.instrument), \(percussion.last_name.replacingOccurrences(of: ",", with: ";")), \(percussion.first_name.replacingOccurrences(of: ",", with: ";")), \(percussion.finalScore), \(percussion.comments.replacingOccurrences(of: ",", with: ";")), \(percussion.scale1_pitch), \(percussion.scale1_production), \(percussion.scale2_pitch), \(percussion.scale2_production), \(percussion.snare_rhythm), \(percussion.snare_tempo), \(percussion.snare_dynamic), \(percussion.snare_production), \(percussion.mallet_rhythm), \(percussion.mallet_pitch),  \(percussion.mallet_tempo), \(percussion.mallet_dynamic), \(percussion.mallet_production), \(percussion.snareRead_rhythm), \(percussion.snareRead_production), \(percussion.malletRead_rhythm), \(percussion.malletRead_pitch), \(percussion.malletRead_production)\n"
                    csvText.append(newLine)
                }
            }
            
            do
            {
                try csvText.write(to: csvPath!, atomically: true, encoding: String.Encoding.utf8)
            }
            catch
            {
                print("Failed to create Freshmen Auditions CSV")
            }
            
        case 2: //Jazz
            for x in 0..<jazzAuditions.count
            {
                for i in 0..<jazzAuditions[x].count
                {
                    auditionsToConvert.append(jazzAuditions[x][i])
                }
            }
            
            for x in 0..<auditionsToConvert.count
            {
                if let rhythm = auditionsToConvert[x] as? jazzRhythms
                {
                    if firstInstance
                    {
                        csvText = "Jazz Rhythms\n, \nInstrument, Preferred Range, Last Name, First Name, Final Score, Comments, Swing: Production, Swing: Rhythm, Swing: Articulations, Straight: Production, Straight: Rhythm, Straight: Articulations, Sight: Production, Sight: Rhythm, Sight: Articulations, Improvisation, Left Hand Indepenence\n"
                        firstInstance = false
                    }
                    
                    
                    let newLine = "\(rhythm.instrument), \(rhythm.preferredRange.replacingOccurrences(of: ",", with: ";")), \(rhythm.last_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.first_name.replacingOccurrences(of: ",", with: ";")), \(rhythm.finalScore), \(rhythm.comments.replacingOccurrences(of: ",", with: ";")), \(rhythm.swing_Production), \(rhythm.swing_Rhythm), \(rhythm.swing_Articulations), \(rhythm.straight_Production), \(rhythm.straight_Rhythm), \(rhythm.straight_Articulations), \(rhythm.sight_Production), \(rhythm.sight_Rhythm), \(rhythm.sight_Articulations), \(rhythm.improvisation), \(rhythm.leftHand_Independence)\n"
                    csvText.append(newLine)
                    
                }
            }
            for x in 0..<auditionsToConvert.count
            {
                if let drumset = auditionsToConvert[x] as? jazzDrumset
                {
                    if firstInstance
                    {
                        csvText.append("\nJazz Drumset\n, \nInstrument, Last Name, First Name, Final Score, Comments, Swing: Support, Swing: Stability,  Swing: Articulations,  Straight: Support, Straight: Stability, Straight: Articulations, Sight: Support, Sight: Stability, Sight: Articulations, Improvisation, Left Hand Independence\n")
                        firstInstance = false
                    }
                    
                    
                    let newLine = "\(drumset.instrument), \(drumset.last_name.replacingOccurrences(of: ",", with: ";")), \(drumset.first_name.replacingOccurrences(of: ",", with: ";")), \(drumset.finalScore), \(drumset.comments.replacingOccurrences(of: ",", with: ";")), \(drumset.swing_Support), \(drumset.swing_Stability), \(drumset.swing_Articulations), \(drumset.straight_Support), \(drumset.straight_Stability), \(drumset.straight_Articulations), \(drumset.sight_Support), \(drumset.sight_Stability), \(drumset.sight_Articulations), \(drumset.improvisation),  \(drumset.leftHand_Independence)\n"
                    csvText.append(newLine)
                }
            }
            
            do {
                try csvText.write(to: csvPath!, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                print("Failed to create Jazz Auditions CSV")
            }
            
        default:
            Swift.print("Default Case in createCSV called, arrayIdentifier = \(arrayIdentifier)")
        }
    }
}
