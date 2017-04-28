//
//  globalVariables.swift
//  Band-Audition-App
//
//  Created by ECCLES, JUSTIN on 1/25/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import Foundation
import UIKit
import os.log

/*
 Index of other global variables not within this file due to relevancy to their files.
 Go to the referenced files for object details
 
 var returnedValue: String -- found within keyboardViewController file
 var senderButton: String -- found within keyboardViewController file
 var keyboardIsEditingInt: Bool -- found within keyboardViewController file
 */

var instrumentType: String = "Error"

/*
 When adding a new audition object, use the following syntax:
 freshmenAudition[0].append(concertWinds object name)
 */

/*
 List the index in relation to the instrument arrays here:
 freshmenAuditions[0] == flute
 freshmenAuditions[1] == oboe
 freshmenAuditions[2] == clarinet
 freshmenAuditions[3] == bass clarinet
 freshmenAuditions[4] == bassoon
 freshmenAuditions[5] == alto sax
 freshmenAuditions[6] == tenor sax
 freshmenAuditions[7] == bari sax
 freshmenAuditions[8] == trumpet
 freshmenAuditions[9] == french horn
 freshmenAuditions[10] == trombone
 freshmenAuditions[11] == euphonium
 freshmenAuditions[12] == string bass
 freshmenAuditions[13] == tuba
 freshmenAuditions[14] == percussion
 */
var freshmenAuditions: [[audition]] = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
let DocumentsDirectoryFA = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURLFA = DocumentsDirectoryFA.appendingPathComponent("FreshmenConcertAuditions")

/*
 List the index in relation to the instrument arrays here:
 varsityAuditions[0] == flute
 varsityAuditions[1] == oboe
 varsityAuditions[2] == clarinet
 varsityAuditions[3] == bass clarinet
 varsityAuditions[4] == bassoon
 varsityAuditions[5] == alto sax
 varsityAuditions[6] == tenor sax
 varsityAuditions[7] == bari sax
 varsityAuditions[8] == trumpet
 varsityAuditions[9] == french horn
 varsityAuditions[10] == trombone
 varsityAuditions[11] == euphonium
 varsityAuditions[12] == string bass
 varsityAuditions[13] == tuba
 varsityAuditions[14] == percussion
 */
var varsityAuditions: [[audition]] = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
let DocumentsDirectoryVA = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURLVA = DocumentsDirectoryVA.appendingPathComponent("VarsityConcertAuditions")

/*
 List the index in relation to the instrument arrays here:
 jazzAuditions[0] == sax
 jazzAuditions[1] == trombone
 jazzAuditions[2] == trumpet
 jazzAuditions[3] == piano
 jazzAuditions[4] == bass guitar
 jazzAuditions[5] == guitar
 jazzAuditions[6] == drumset
 jazzAuditions[7] == vibraphone
 */
var jazzAuditions: [[audition]] = [[], [], [], [], [], [], [], []]
let DocumentsDirectoryJ = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURLJ = DocumentsDirectoryJ.appendingPathComponent("JazzAuditions")


//Freshmen Functions
func saveFreshmenAuditions()
{
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(freshmenAuditions, toFile: ArchiveURLFA.path)
    if isSuccessfulSave
    {
        os_log("Freshmen Auditions successfully saved.", log: OSLog.default, type: .debug)
    }
    else
    {
        os_log("Failed to save Freshmen Auditions...", log: OSLog.default, type: .error)
    }
}

func loadFreshmenAuditions()
{
    if let test = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURLFA.path) as? [[audition]]
    {
        freshmenAuditions = test
    }
    else
    {
        os_log("Failed to load Freshmen Auditions...", log: OSLog.default, type: .error)
    }
}

//Varsity Functions
func saveVarsityAuditions()
{
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(varsityAuditions, toFile: ArchiveURLVA.path)
    if isSuccessfulSave
    {
        os_log("Varsity Auditions successfully saved.", log: OSLog.default, type: .debug)
    }
    else
    {
        os_log("Failed to save Varsity Auditions...", log: OSLog.default, type: .error)
    }
}

func loadVarsityAuditions()
{
    if let test = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURLVA.path) as? [[audition]]
    {
        varsityAuditions = test
    }
    else
    {
        os_log("Failed to load Varsity Auditions...", log: OSLog.default, type: .error)
    }
}

//Jazz Functions
func saveJazzAuditions()
{
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(jazzAuditions, toFile: ArchiveURLJ.path)
    if isSuccessfulSave
    {
        os_log("Jazz Auditions successfully saved.", log: OSLog.default, type: .debug)
    }
    else
    {
        os_log("Failed to save Jazz Auditions...", log: OSLog.default, type: .error)
    }
}

func loadJazzAuditions()
{
    if let test = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURLJ.path) as? [[audition]]
    {
        jazzAuditions = test
    }
    else
    {
        os_log("Failed to load Jazz Auditions...", log: OSLog.default, type: .error)
    }
}


/*All functions below this comment are for the purpose of sorting the data in the 2D arrays above. In the viewControllers, the only thing you should be calling is "sortAuditionsByScore" or "sortAuditionsByName"*/
func sortAuditionsByScore(array: Int) //1=Varsity, 2=Freshmen, 3=Jazz
{
    switch array
    {
    case 1://Varsity
        for index in 0 ..< varsityAuditions.count
        {
            varsityAuditions[index] = sortArrayByScore(from: varsityAuditions[index])
            
        }
    case 2://Freshmen
        for index in 0 ..< freshmenAuditions.count
        {
            freshmenAuditions[index] = sortArrayByScore(from: freshmenAuditions[index])
            
        }
    case 3://Jazz
        for index in 0 ..< jazzAuditions.count
        {
            jazzAuditions[index] = sortArrayByScore(from: jazzAuditions[index])
            
        }
    default:
        Swift.print("Default case called in sortAuditionsByScore. Array = \(array)")
    }
}

func sortAuditionsByName(array: Int) //1=Varsity, 2=Freshmen, 3=Jazz
{
    switch array
    {
    case 1://Varsity
        for index in 0 ..< varsityAuditions.count
        {
            varsityAuditions[index] = sortArrayByName(from: varsityAuditions[index])
            
        }
    case 2://Varsity
        for index in 0 ..< freshmenAuditions.count
        {
            freshmenAuditions[index] = sortArrayByName(from: freshmenAuditions[index])
            
        }
    case 3://Jazz
        for index in 0 ..< jazzAuditions.count
        {
            jazzAuditions[index] = sortArrayByName(from: jazzAuditions[index])
            
        }
    default:
        Swift.print("Default case called in sortAuditionsByName. Array = \(array)")
    }
}

func sortArrayByScore(from array: [audition]) -> [audition]
{
    let sortedArray = array.sorted{ $0.finalScore > $1.finalScore } //Used built in XCode sorting method
    return sortedArray
}

func sortArrayByName (from array: [audition]) -> [audition]
{
    let sortedArray = array.sorted{ $0.last_name.lowercased() < $1.last_name.lowercased()} //Used built in XCode sorting method
    return sortedArray
}
