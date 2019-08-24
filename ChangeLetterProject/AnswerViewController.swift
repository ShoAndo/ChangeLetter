//
//  AnswerViewController.swift
//  ChangeLetterProject
//
//  Created by 安藤奨 on 2019/08/23.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var inputSentence:String = ""
    var outputSentence: String = ""
    
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = backButton.layer.bounds.width/2
        copyButton.layer.cornerRadius = copyButton.layer.bounds.width/2
        inputTextView.layer.cornerRadius = 5.0
        outputTextView.layer.cornerRadius = 5.0
        
        inputTextView.text = inputSentence
        outputTextView.text = outputSentence
        print(outputSentence)
        self.parent?.navigationItem.title = "結果"

    }
    
    @IBAction func didClickBackButton(_ sender: Any) {
       performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
    @IBAction func didClickCopyButton(_ sender: Any) {
    }
    @IBAction func didClickBarButton(_ sender: Any) {
         performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
}
