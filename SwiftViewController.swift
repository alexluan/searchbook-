//
//  SwiftViewController.swift
//  searchbook
//
//  Created by 栾有数 on 15/9/25.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

import UIKit



class SwiftViewController: UIViewController {

    var kk: NSString!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pop(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
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
