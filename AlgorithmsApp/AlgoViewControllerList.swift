


//
//  AlgoViewControllerList.swift
//  AlgorithmsApp
//
//  Created by Danya on 05.09.16.
//  Copyright © 2016 Danya. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class AlgoViewControllerList: UICollectionViewController {

    var Dict : NSDictionary?
    private var namesOfRows = ["firstTab","secondTab","thirdTab","fouredTab"]
    var row : Int = 0
    var tittles : [String] = ["Сортировка","Структуры данных","Поиск. Строки, последовательности","Графика"]
    
    @IBOutlet weak var menuButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil{
            menuButton.target  = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
     //   self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationItem.title = tittles[row]
        self.navigationItem.titleView?.updateConstraints()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.groupTableViewBackgroundColor()
        self.revealViewController().rearViewRevealWidth = 330
        let path = NSBundle.mainBundle().pathForResource("algoNames", ofType: "plist")
        Dict = NSDictionary(contentsOfFile: path!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let count = (Dict![namesOfRows[row]])!.count //as? Int32
        return count
    }


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! AlgoViewCell
        cell.cellLabel.numberOfLines = 3
        cell.cellLabel.lineBreakMode = .ByWordWrapping
        cell.cellLabel!.font = UIFont(name: "Helvetica", size: 33)
        let nn  = (Dict![namesOfRows[row]] as! NSArray)[indexPath.row] as! AnyObject
        //cell.cellLabel.text = Dict![namesOfRows[row]]![indexPath.row]! as? String
        cell.cellLabel.text = nn as? String
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = collectionView?.indexPathForCell(sender as! UICollectionViewCell)
        let nextVC = segue.destinationViewController as! TxtViewController
        if indexPath?.section == 0 {
            nextVC.firstRow = row
            nextVC.SecondRow = (indexPath?.row)!
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
