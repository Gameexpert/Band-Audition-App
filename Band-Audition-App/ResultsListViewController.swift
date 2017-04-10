//
//  ResultsListViewController.swift
//  Band-Audition-App
//
//  Created by VANDER HOEVEN, EVAN on 4/4/17.
//  Copyright © 2017 Copy Pasta Coding. All rights reserved.
//

import UIKit

//MARK: Properties
var arrayIdentifier: Int = -1 //0 = Varsity, 1 = Freshmen, 3 = Jazz, anything else is an error

class ResultsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    let cellReuseIdentifier = "concertCell"
    var resultsList: [audition] = []
    
    //MARK: Properties
    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var exportButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        resultsList = updateArrayValues()

        tableView.register(concertCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resultsList = updateArrayValues()
    }
    
    func updateArrayValues() -> [audition]{
        var output: [audition] = []
        
        for x in 0..<freshmenAuditions.count{
            for i in 0..<freshmenAuditions[x].count{
                output.append(freshmenAuditions[x][i])
            }
        }
        
        return output
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Functions
    @IBAction func sortControlChanged(_ sender: UISegmentedControl)
    {
        //tableView.reloadData
    }
    
    //This function gives me the option to delete stuff.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            /*
             find out which item in the 2D array is the reference cell and remove it from the global 2D array.
             */
            //self.resultsList[indexPath.row].instrument
            
            self.resultsList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    //functions to make the tableview work
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath as IndexPath) as! concertCell
        
        cell.labels["Instrument"]?.Label.text = resultsList[indexPath.row].instrument
        cell.labels["Name"]?.Label.text = "\(resultsList[indexPath.row].last_name), \(resultsList[indexPath.row].first_name)"
        cell.labels["Score"]?.Label.text = String(resultsList[indexPath.row].finalScore)
        
        return cell
    }
}
