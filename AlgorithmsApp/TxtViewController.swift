//
//  TxtViewController.swift
//  AlgorithmsApp
//
//  Created by Danya on 14.09.16.
//  Copyright © 2016 Danya. All rights reserved.
//

import UIKit

var myDict : NSDictionary?

class TxtViewController: UIViewController {

    let di : [Int : [String]] = [
        0 : ["firstVybor", "firstVstavka", "firstTopo", "firstPyzir", "firstSliyanie", "firstPiramida", "firstBystraya", "firstPorazryadnaya"]
    ]
    
    @IBOutlet weak var textView: UITextView!
    var firstRow : Int = 0
    var SecondRow : Int = 0
    var diction : [String : Int] = ["" : 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil{
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        textView.editable = false
        textView.selectable = true
        textView.textColor = UIColor.init(red: 0.6, green: 0.6, blue: 0.5, alpha: 0.8)
        loadText()
        
        let path = NSBundle.mainBundle().pathForResource("textList", ofType: "plist")
        myDict = NSDictionary(contentsOfFile: path!)!
    }

    private func loadText(){
        print(firstRow)
        print(SecondRow)
       // let temp = (myDict![names[firstRow]] as! NSArray)[SecondRow] as? AnyObject
        let url : NSURL = NSBundle.mainBundle().URLForResource(/*temp*/ (di[firstRow])![SecondRow], withExtension: "txt")!
        if let loaded = Url.open(url){
            textView.text = loaded;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
