//
//  ResultsListViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 4/4/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

//MARK: Global Properties
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
    
    var itemLocation: [Int] = [-1,-1] //Stores the location in the given 2D array to prevent duplicate data.
    
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
        tableView.reloadData()
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
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            //SECOND TASK
            switch arrayIdentifier
            {
            case 0: //Varsity
                varsityAuditions = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
                saveVarsityAuditions()
                loadVarsityAuditions()
            case 1: //Freshmen
                freshmenAuditions = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
                saveFreshmenAuditions()
                loadFreshmenAuditions()
            case 2: //Jazz
                jazzAuditions = [[], [], [], [], [], [], [], []]
                saveJazzAuditions()
                loadJazzAuditions()
            default:
                Swift.print("Failed to delete data, arrayIdentifier: \(arrayIdentifier)")
            }
            
            //THIRD TASK
            self.resultsList = self.updateArrayValues()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
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
            sortAuditionsByName(array: arrayIdentifier + 1)
        }
        else //Sort by score
        {
            sortAuditionsByScore(array: arrayIdentifier + 1)
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
            cell.labels["Sax/Range"]?.Label.text = rhythm.preferredRange
            cell.labels["Name"]?.Label.text = "\(rhythm.last_name), \(rhythm.first_name)"
            cell.labels["Score"]?.Label.text = String(rhythm.finalScore)
                
            return cell
        }
        else if let winds = resultsList[indexPath.row] as? concertWinds
        {
            cell.labels["Instrument"]?.Label.text = winds.instrument
            cell.labels["Sax/Range"]?.Label.text = "" //Makes it blank since the data doesn't exist
            cell.labels["Name"]?.Label.text = "\(winds.last_name), \(winds.first_name)"
            cell.labels["Score"]?.Label.text = String(winds.finalScoreDouble)
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
    
    //This function is activated when a cell is pressed, will segue to the form needed.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        /*
         Using the same code I use for deletion, I am searching for the location in the 2D array where the pressed button was. This data is used in the unwind segues to stop duplicate data after editing forms. In the case of duplicate data already existing, only the first data set location is stored.
         */
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
                    itemLocation = [superIndex, subIndex]
                    break //Only Stores the first instance of duplicate cells.
                }
            }
        case 1: //freshmenAuditions
            let superIndex: Int = findSuperIndex(instrument: self.resultsList[indexPath.row].instrument)
            
            for subIndex in 0 ..< freshmenAuditions[superIndex].count
            {
                if freshmenAuditions[superIndex][subIndex].last_name == lastName && freshmenAuditions[superIndex][subIndex].first_name == firstName && freshmenAuditions[superIndex][subIndex].finalScore == score && freshmenAuditions[superIndex][subIndex].comments == comment //Checks four qualities so that we know that it is this data point that is the one that the user wants deleted.
                {
                    itemLocation = [superIndex, subIndex]
                    break //Only Stores the first instance of duplicate cells.
                }
            }
        case 2: //jazzAuditions
            let superIndex: Int = findSuperIndex(instrument: self.resultsList[indexPath.row].instrument)
            
            for subIndex in 0 ..< jazzAuditions[superIndex].count
            {
                if jazzAuditions[superIndex][subIndex].last_name == lastName && jazzAuditions[superIndex][subIndex].first_name == firstName && jazzAuditions[superIndex][subIndex].finalScore == score && jazzAuditions[superIndex][subIndex].comments == comment //Checks four qualities so that we know that it is this data point that is the one that the user wants deleted.
                {
                    itemLocation = [superIndex, subIndex]
                    break //Only Stores the first instance of duplicate cells.
                }
            }
        default:
            Swift.print("Default Called in func tableView for segue, arrayIdentifier = \(arrayIdentifier)")
        }
        
        //Find out what form I am segueing to based on cell data.
        //First set will have comments describing the code, the rest will follow the same structure.
        if let VCP = resultsList[indexPath.row] as? varsityConcertPercussion
        {
            //Setting Global Variables that are necessary for the Review form to work
            vpAudition = varsityConcertPercussion(VCP)//Setting the global variable for passing data
            isReviewing = true //Lets the viewDidLoad method in the other form know to switch styles
            
            //Setting variables that are also set in the segue from the TabeView, and are needed for the viewDidLoad function
            instrumentType = VCP.instrument
            
            //Following three lines "presents" the FPAuditionViewController programatically.
            let newVCName = "VPAudition"
            let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
            present(viewController!, animated: true, completion: nil)
            
        }
        else if let FCP = resultsList[indexPath.row] as? freshmenConcertPercussion
        {
            //Setting Global Variables that are necessary for the Review form to work
            fpAudition = freshmenConcertPercussion(FCP)
            isReviewing = true
            
            //Setting variables that are also set in the segue from the TabeView, and are needed for the viewDidLoad function
            instrumentType = FCP.instrument
            
            //Following three lines "presents" the FPAuditionViewController programatically.
            let newVCName = "FPAudition"
            let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
            present(viewController!, animated: true, completion: nil)
        }
        else if let CW = resultsList[indexPath.row] as? concertWinds
        {
            //Setting Global Variables that are necessary for the Review form to work
            concertWindsAudition = concertWinds(CW)
            isReviewing = true
            
            //Setting variables that are also set in the segue from the TabeView, and are needed for the viewDidLoad function
            instrumentType = CW.instrument
            category = CW.concert_type
            
            //Following three lines "presents" the FPAuditionViewController programatically.
            let newVCName = "concertWinds"
            let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
            present(viewController!, animated: true, completion: nil)
        }
        else if let JD = resultsList[indexPath.row] as? jazzDrumset
        {
            //Setting Global Variables that are necessary for the Review form to work
            jazzDrumAudition = jazzDrumset(JD)
            isReviewing = true
            
            //Setting variables that are also set in the segue from the TabeView, and are needed for the viewDidLoad function
            instrumentType = JD.instrument
            
            //Following three lines "presents" the JDAuditionViewController programatically.
            let newVCName = "JDAudition"
            let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
            present(viewController!, animated: true, completion: nil)
        }
        else if let JR = resultsList[indexPath.row] as? jazzRhythms
        {
            //Setting Global Variables that are necessary for the Review form to work
            jazzRhythmAudition = jazzRhythms(JR)
            isReviewing = true
            
            //Setting variables that are also set in the segue from the TabeView, and are needed for the viewDidLoad function
            instrumentType = JR.instrument
            
            //Following three lines "presents" the JRAuditionViewController programatically.
            let newVCName = "JRAudition"
            let viewController = storyboard?.instantiateViewController(withIdentifier: newVCName)
            present(viewController!, animated: true, completion: nil)
        }
        else
        {
            Swift.print("Data in cell does not match currently known audition types.")
        }
    }
    //Adding all the unwind segue recievers to allow the back button to work
    @IBAction func recieveVPUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if !isReviewing //The Edit button was pressed in the form, regardless of if the user tapped "Save" or "<Back"
        {
            varsityAuditions[itemLocation[0]].remove(at: itemLocation[1])
            sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
        }
    }
    @IBAction func recieveFPUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if !isReviewing //The Edit button was pressed in the form, regardless of if the user tapped "Save" or "<Back"
        {
            freshmenAuditions[itemLocation[0]].remove(at: itemLocation[1])
            sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
        }
    }
    @IBAction func recieveConcertWindsUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if !isReviewing //The Edit button was pressed in the form, regardless of if the user tapped "Save" or "<Back"
        {
            if arrayIdentifier == 0 //Varsity Audition was edited
            {
                varsityAuditions[itemLocation[0]].remove(at: itemLocation[1])
                sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
            }
            else if arrayIdentifier == 1 //Freshmen Audition was edited
            {
                freshmenAuditions[itemLocation[0]].remove(at: itemLocation[1])
                sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
            }
            else
            {
                Swift.print("A Concert Winds was edited, but somehow we aren't looking at Varsity or Freshmen.")
            }
            
        }
    }
    @IBAction func recieveJDUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if !isReviewing //The Edit button was pressed in the form, regardless of if the user tapped "Save" or "<Back"
        {
            jazzAuditions[itemLocation[0]].remove(at: itemLocation[1])
            sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
        }
    }
    @IBAction func recieveJRUnwindSegue(unwindSegue: UIStoryboardSegue)
    {
        if !isReviewing //The Edit button was pressed in the form, regardless of if the user tapped "Save" or "<Back"
        {
            jazzAuditions[itemLocation[0]].remove(at: itemLocation[1])
            sortControlChanged(sortControl) //Automatically sorts the 2D array appropiately, reloads the 2D data into resultsList, and updates the view properly
        }
    }
    
    
    //This function gives me the option to delete stuff.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        //Adds a button when you swipe from right to left on the tableView. everything after "in" is executed when you press the button. Notice it is similar to the UIAlert code
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
