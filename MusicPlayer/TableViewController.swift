//
//  TableViewController.swift
//  MusicPlayer
//
//  Created by Telecomunicaciones Abiertas de México on 2/19/16.
//  Copyright © 2016 Telecomunicaciones Abiertas de México. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var audios : Array<Array<String>> = Array<Array<String>>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Player"
        self.audios.append(["1","A Sky Full of Stars","Ghost Stories","ColdPlay"])
        self.audios.append(["2","Alive","Ice on the Dune","Empire of th Sound"])
        self.audios.append(["3","Mis Sentimientos","Como Te Voy a Olvidar","Angeles Azules"])
        self.audios.append(["4","Muerte En Hawai","Entren Los Que Quieran","Calle 13"])
        self.audios.append(["5","Go","The Race For Space","Public Broadcasting Service"])
        self.audios.append(["6","Riot Van","Straighten the Rudder","Arctic Monkeys"])
        self.audios.append(["7","The Bay","The English Riviera","Metronomy"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.audios.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.audios[indexPath.row][1]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let voy = segue.destinationViewController as! ViewController
        let indexPath_ = self.tableView.indexPathForSelectedRow

        if ((indexPath_ != nil)) {
            voy.id = self.audios[indexPath_!.row][0]
            voy.album = self.audios[indexPath_!.row][2]
            voy.cancion = ("\(self.audios[indexPath_!.row][1]) - \(self.audios[indexPath_!.row][3])")
            voy.cover = self.audios[indexPath_!.row][2]
        } else {
            let diceRoll = Int(arc4random_uniform(5) + 1)
            print("Voy en Random \(diceRoll)")
            voy.id = self.audios[diceRoll][0]
            voy.album = self.audios[diceRoll][2]
            voy.cancion = ("\(self.audios[diceRoll][1]) - \(self.audios[diceRoll][3])")
            voy.cover = self.audios[diceRoll][2]
            
        }
        
    }


}
