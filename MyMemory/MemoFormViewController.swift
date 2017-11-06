//
//  MemoFormViewController.swift
//  MyMemory
//
//  Created by Yeojong on 2017. 9. 11..
//  Copyright © 2017년 Yeojong. All rights reserved.
//

import UIKit

class MemoFormViewController: UIViewController, UIImagePickerControllerDelegate,
        UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    // Code에는 없는 내용
    var subject: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func save(_ sender: Any) {
        guard self.contents.text?.isEmpty == false else {
            // guard if not과 같은 동작인 듯. 조건이 false 일 때 블럭 내용이 실행 됨.
            let alert = UIAlertController(title: nil, message: "내용을 입력해 주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            return
        }
        
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regDate = Date()
        
        // AppDelegate을 가져와서 memoList에 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        // 작성폼 화면을 종료하고, 이전 화면으로 되돌아 간다.
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let desc = textView.text as NSString
        let length = ((desc.length > 15) ? 15 : desc.length)
        self.subject = desc.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
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
