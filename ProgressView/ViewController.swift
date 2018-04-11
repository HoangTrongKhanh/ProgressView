//
//  ViewController.swift
//  ProgressView
//
//  Created by Hoàng Khánh on 4/11/18.
//  Copyright © 2018 Hoàng Khánh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let maxTime = 3.0 //3 seconds
    var currentTime = 0.0
    let timeInterval = 0.03 //refresh after 0.03s
    var myTimer: Timer?
    
    @IBAction func btnStart(_ sender: Any) {
        guard myTimer == nil else {return}
        myTimer?.invalidate()
        myTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateUI(sender:)), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateUI(sender: Timer) {
        if(currentTime < maxTime) {
            currentTime += timeInterval
            progressView.progress = Float(currentTime/maxTime)
            lblProgress.text = "\(Int(currentTime*100 / maxTime))%"
        } else {
            currentTime = 0
            myTimer?.invalidate()
            myTimer = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(0.0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

