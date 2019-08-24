//
//  ViewController.swift
//  ChangeLetterProject
//
//  Created by 安藤奨 on 2019/08/23.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appId = "0eb701b64f70bc8d842d6e2d30a879af8370b18484263996ffed2670ada05747"
    var outputSentence = ""
    var inputSentence = ""

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = button.layer.bounds.width/2
        textView.layer.cornerRadius = 5.0
     
     }

    @IBAction func didClickButton(_ sender: Any) {
        
        inputSentence = textView.text!
        
        var request = URLRequest(url: URL(string: "https://labs.goo.ne.jp/api/hiragana")!,cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postData = PostData(app_id: appId, request_id: "record003", sentence:inputSentence , output_type:"hiragana" )
        
        
        guard let uploadData = try? JSONEncoder().encode(postData) else {
            return
        }
        request.httpBody = uploadData
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            
            guard let data = data, let jsonData = try? JSONDecoder().decode(Rubi.self, from: data) else {
                print("json変換に失敗しました")
                return
            }
            
            self.outputSentence = jsonData.converted
            print(self.outputSentence)
            print(jsonData.converted)
          
        }
        task.resume()

        performSegue(withIdentifier: "toResult", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let AnswerVC = segue.destination as! AnswerViewController
            
            AnswerVC.outputSentence = outputSentence
            AnswerVC.inputSentence = inputSentence
        }
    }
 
}

