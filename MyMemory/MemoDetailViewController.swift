//
//  MemoDetailViewController.swift
//  MyMemory
//
//  Created by Yeojong on 2017. 9. 11..
//  Copyright © 2017년 Yeojong. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController {

    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    var memo: MemoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        subject.text = memo?.title
        contents.text = memo?.contents
        img.image = memo?.image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
