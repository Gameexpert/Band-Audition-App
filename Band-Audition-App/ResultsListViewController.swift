//
//  ResultsListViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 4/4/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

//MARK: Properties
var arrayIdentifier: Int = -1 //0 = Varsity, 1 = Freshmen, 2 = Jazz, anything else is an error

class ResultsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //MARK: Properties
    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "auditionCell"
    var resultsList: [audition] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultsList = updateArrayValues()

        tableView.register(auditionCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        resultsList = updateArrayValues()
    }
    
    //MARK: Functions
    
    @IBAction func deleteCategoryWithWarning(_ sender: UIButton)
    {
        /*
         First, create a UIAlert to stop the user from deleting all data accidently.
         Second, delete the data
         Third, call updateArrayValues and display ta blank tableView
         */
        
        //FIRST TASK
        // create the alert
        let alert = UIAlertController(title: "Delete Entire Category", message: "This action cannot be undone, are you sure you want to continue?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the options for the user (buttons on the bottom of the UIAlert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { action in
            //SECOND TASK
            switch arrayIdentifier
            {
            case 0: //Varsity
                varsityAuditions = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
                saveVarsityAuditions()
            case 1: //Freshmen
                freshmenAuditions = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
                saveFreshmenAuditions()
            case 2: //Jazz
                jazzAuditions = [[], [], [], [], [], [], [], []]
                saveJazzAuditions()
            default:
                Swift.print("Failed to delete data, arrayIdentifier: \(arrayIdentifier)")
            }
            
            //THIRD TASK
            self.resultsList = self.updateArrayValues()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func updateArrayValues() -> [audition]{
        var output: [audition] = []
        switch arrayIdentifier
        {
        case 0://Varsity
            for x in 0..<varsityAuditions.count
            {
                for i in 0..<varsityAuditions[x].count
                {
                    output.append(varsityAuditions[x][i])
                }
            }
        case 1: //Freshmen
            for x in 0..<freshmenAuditions.count
            {
                for i in 0..<freshmenAuditions[x].count
                {
                    output.append(freshmenAuditions[x][i])
                }
            }
        case 2: //Jazz
            for x in 0..<jazzAuditions.count
            {
                for i in 0..<jazzAuditions[x].count
                {
                    output.append(jazzAuditions[x][i])
                }
            }
        default:
            Swift.print("Default Case in updateArrayValues called, arrayIdentifier = \(arrayIdentifier)")
        }
        
        return output
    }

    //MARK: Functions
    @IBAction func sortControlChanged(_ sender: UISegmentedControl)
    {
        let controlIndex = sender.selectedSegmentIndex //0 = sort by name, 1 = sort by score
        if controlIndex == 0 //Sort by name
        {
            switch arrayIdentifier
            {
            case 0: //Varsity
                sortAuditionsByName(array: 1)
            case 1: //Freshmen
                sortAuditionsByName(array: 2)
            case 2: //Jazz
                sortAuditionsByName(array: 3)
            default:
                Swift.print("Default case called in sortControlChanged, switch-case 1. controlIndex = \(controlIndex), arrayIdentifier = \(arrayIdentifier)")
            }
        }
        else //Sort by score
        {
            switch arrayIdentifier
            {
            case 0: //Varsity
                sortAuditionsByScore(array: 1)
            case 1: //Freshmen
                sortAuditionsByScore(array: 2)
            case 2: //Jazz
                sortAuditionsByScore(array: 3)
            default:
                Swift.print("Default case called in sortControlChanged, switch-case 2. controlIndex = \(controlIndex), arrayIdentifier = \(arrayIdentifier)")
            }
        }
        resultsList = updateArrayValues()
        tableView.reloadData()
    }
    
    
    //functions to make the tableview work
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath as IndexPath) as! auditionCell
            
            
        if let rhythm = resultsList[indexPath.row] as? jazzRhythms //Reads the item as the extension of the protocol in order to read specific values, works for jazzRhythm objects
        {
            cell.labels["Instrument"]?.Label.text = rhythm.instrument
            Swift.print("\(rhythm.instrument)")
            cell.labels["Sax/Range"]?.Label.text = rhythm.preferredRange
            Swift.print("\(rhythm.preferredRange)")
            cell.labels["Name"]?.Label.text = "\(rhythm.last_name), \(rhythm.first_name)"
            cell.labels["Score"]?.Label.text = String(resultsList[indexPath.row].finalScore)
                
            return cell
        }
        else //If this is anything else, jazz drumset or concert.
        {
            cell.labels["Instrument"]?.Label.text = resultsList[indexPath.row].instrument
            cell.labels["Sax/Range"]?.Label.text = "" //Makes it blank since the data doesn't exist
            cell.labels["Name"]?.Label.text = "\(resultsList[indexPath.row].last_name), \(resultsList[indexPath.row].first_name)"
            cell.labels["Score"]?.Label.text = String(resultsList[indexPath.row].finalScore)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return resultsList.count
    }
    
    //This function gives me the option to delete stuff.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete"){ (action, indexPath) in
            // delete item at indexPath from the global 2D array
            /*
             find out which item in the 2D array is the reference cell (using the information that I can find in it) and remove it from the global 2D array.
             */
            let lastName = self.resultsList[indexPath.row].last_name
            let firstName = self.resultsList[indexPath.row].first_name
            let score = self.resultsList[indexPath.row].finalScore
            let comment = self.resultsList[indexPath.row].comments
            
            switch arrayIdentifier
            {
            case 0: //varsityAuditions
                let superIndex: Int = findSuperIndex(instrument: self.resultsList[indexPath.row].instrument)
                
                for subIndex in 0 ..< varsityAuditions[superIndex].count
                {
                    if varsityAuditions[superIndex][subIndex].last_name == lastName && varsityAuditions[superIndex][subIndex].first_name == firstName && varsityAuditions[superIndex][subIndex].finalScore == score && varsityAuditions[superIndex][subIndex].comments == comment //Checks four qualities so that we know that it is this data point that is the one that the user wants deleted.
                    {
                        varsityAuditions[superIndex].remove(at: subIndex)
                        saveVarsityAuditions()
                        break //Only deletes the first instance of duplicate cells.
                    }
                }
            case 1: //freshmenAuditions
                let superIndex: Int = findSuperIndex(instrument: self.resultsList[indexPath.row].instrument)
                
                for subIndex in 0 ..< freshmenAuditions[superIndex].count
                {
                    if freshmenAuditions[superIndex][subIndex].last_name == lastName && freshmenAuditions[superIndex][subIndex].first_name == firstName && freshmenAuditions[superIndex][subIndex].finalScore == score && freshmenAuditions[superIndex][subIndex].comments == comment //Checks four qualities so that we know that it is this data point that is the one that the user wants deleted.
                    {
                        freshmenAuditions[superIndex].remove(at: subIndex)
                        saveFreshmenAuditions()
                        break //Only deletes the first instance of duplicate cells.
                    }
                }
            case 2: //jazzAuditions
                let superIndex: Int = findSuperIndex(instrument: self.resultsList[indexPath.row].instrument)
                
                for subIndex in 0 ..< jazzAuditions[superIndex].count
                {
                    if jazzAuditions[superIndex][subIndex].last_name == lastName && jazzAuditions[superIndex][subIndex].first_name == firstName && jazzAuditions[superIndex][subIndex].finalScore == score && jazzAuditions[superIndex][subIndex].comments == comment //Checks four qualities so that we know that it is this data point that is the one that the user wants deleted.
                    {
                        jazzAuditions[superIndex].remove(at: subIndex)
                        saveJazzAuditions()
                        break //Only deletes the first instance of duplicate cells.
                    }
                }
            default:
                Swift.print("Default Called in func tableView for deletion, arrayIdentifier = \(arrayIdentifier)")
            }
            
            self.resultsList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
}
/*
 Helper Function for deleting data
 Finds the index of the "super" array in the 2D array that is being displayed in the results view
 @param instrument  String that identifies the instrument of the soon-to-be deleted object
 @return    an Int that will be used as the superIndex in the 2D array for a for loop.
 */
func findSuperIndex(instrument: String) -> Int
{
    if arrayIdentifier == 2 //Jazz Auditions
    {
        switch instrument
        {
        case "Saxophone":
            return 0
        case "Trombone":
            return 1
        case "Trumpet":
            return 2
        case "Piano":
            return 3
        case "Bass Guitar":
            return 4
        case "Guitar":
            return 5
        case "Drumset":
            return 6
        case "Vibraphone":
            return 7
        default:
            Swift.print("Default case in findSuperIndex called. arrayIdentifier = \(arrayIdentifier), instrument = \(instrument)")
        }
    }
    else //Varsity or freshmen
    {
        switch instrument //See globalVariables.swift comments to see why the switch case works the way it does
        {
        case "Flute":
            return 0
        case "Oboe":
            return 1
        case "Clarinet":
            return 2
        case "Bass Clarinet":
            return 3
        case "Bassoon":
            return 4
        case "Alto Saxophone":
            return 5
        case "Tenor Saxophone":
            return 6
        case "Bari Saxophone":
            return 7
        case "Trumpet":
            return 8
        case "French Horn":
            return 9
        case "Trombone":
            return 10
        case "Euphonium":
            return 11
        case "String Bass":
            return 12
        case "Tuba":
            return 13
        case "Percussion":
            return 14
        default:
            Swift.print("Default case in findSuperIndex called. arrayIdentifier = \(arrayIdentifier), instrument = \(instrument)")
        }
    }
    return -1 //Should never happen, but it's different from expected values and can indicate what kind of error is occuring.
}
