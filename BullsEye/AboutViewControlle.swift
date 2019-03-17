//
//  AboutViewControlle.swift
//  BullsEye
//
//  Created by Zheng Wan Zhang on 2019/2/18.
//  Copyright © 2019 Zheng Wan Zhang. All rights reserved.
//

import UIKit
import WebKit


class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            let  request = URLRequest(url: url)
            webView.load(request)
        }

        //if let url = URL.init(string: "http://www.apple.com"){
          //  let request = URLRequest(url: url)
          //  webView.load(request)
        //}
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func close(){
        dismiss(animated:  true, completion: nil)
    }
    
}

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


