//
//  MemoListViewContoller.swift
//  MyMemory
//
//  Created by Yeojong on 2017. 9. 11..
//  Copyright © 2017년 Yeojong. All rights reserved.
//

import UIKit

class MemoListViewContoller: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = self.appDelegate.memoList.count
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Data를 가져옴
        let row = self.appDelegate.memoList[indexPath.row]
        
        if row.image == nil {

            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") as! MemoCell
            
            cell.subject?.text = row.title
            cell.contents?.text = row.contents
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            cell.regDate?.text = formatter.string(from: row.regDate!)
            
            return cell

        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCellWithImage") as! MemoCellWithImage
        
        cell.img?.image = row.image
        cell.title?.text = row.title
        cell.contents?.text = row.contents
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regDate?.text = formatter.string(from: row.regDate!)
        
        return cell

        
    }
    
    // 각 Row의 Height을 정해서 return할 수 있음.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "read_sg" {
            let index = self.tableView.indexPathForSelectedRow!.row
            
            (segue.destination as! MemoDetailViewController).memo = self.appDelegate.memoList[index]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "read_sg", sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
