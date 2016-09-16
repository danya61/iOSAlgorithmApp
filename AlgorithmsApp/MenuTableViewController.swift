//
//  MenuTableViewController.swift
//  AlgorithmsApp
//
//  Created by Danya on 03.09.16.
//  Copyright © 2016 Danya. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let CellIdentificator = "MenuCellName"
    let cells = ["Сортировка","Структуры данных","Поиск. Строки и последовательности","Графика"]
    var pointsize : CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let prefferedFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        pointsize = prefferedFont.pointSize
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Выберите тему:  "
        }
        else {
            return ""
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cells.count
        } else {
            return 4
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentificator, forIndexPath: indexPath)
        cell.textLabel?.font = UIFont.italicSystemFontOfSize(pointsize)
        if indexPath.section  == 0 {
            cell.textLabel?.text = cells[indexPath.row] }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "Избранное"
            }
            else {
                cell.textLabel?.text = ""
            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section == 1 {
            if indexPath.row != 0 {
                return nil
            }
            else {
                return indexPath
            }
        }
        else {
            return indexPath
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return pointsize + 40
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
 

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        let nav = segue.destinationViewController as! UINavigationController
        let listVC = nav.topViewController as! AlgoViewControllerList
        if indexPath?.section == 0{
//            for index in 0...3 {
//              listVC.tittles[index] = cells[index]
//            }
            listVC.row = (indexPath?.row)!
        }
    }

}
