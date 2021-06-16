//
//  SecondViewController.swift
//  TrafficLights
//
//  Created by Apple on 16/06/2021.
//

import UIKit

class SecondViewController: ViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!

    @IBOutlet weak var timeLabel: UILabel!
    
    struct data {
        var redTime : Int = 0
        var yellowTime: Int = 0
        var greenTime: Int = 0
    }
    
    var data2 = data()
    var red = 0
    var yellow = 0
    var green = 0
    
    var timer : Timer!
    var timerRed: Timer!
    var timerYellow: Timer!
    var timerGreen: Timer!
    var time : Int = 0
    override func viewDidLoad() {

        super.viewDidLoad()
        
        red = data2.redTime
        yellow = data2.yellowTime
        green = data2.greenTime
        
        redView.layer.cornerRadius = 50
        yellowView.layer.cornerRadius = 50
        greenView.layer.cornerRadius = 50
        
        time = red + yellow + green
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(lightTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func lightTime() {
        switch time {
        case (yellow + green + 1)...(yellow + green + red):
            redView.backgroundColor = UIColor.red
            yellowView.backgroundColor = UIColor.lightGray
            greenView.backgroundColor = UIColor.lightGray
            timeLabel.text = "\(time - yellow - green)"
            time -= 1
        case (green + 1)...(yellow + green):
            redView.backgroundColor = UIColor.lightGray
            yellowView.backgroundColor = UIColor.yellow
            greenView.backgroundColor = UIColor.lightGray
            timeLabel.text = "\(time - green)"
            time -= 1
        case 1...green:
            redView.backgroundColor = UIColor.lightGray
            yellowView.backgroundColor = UIColor.lightGray
            greenView.backgroundColor = UIColor.green
            timeLabel.text = "\(time)"
            time -= 1
        default:
            time = yellow + green + red
            redView.backgroundColor = UIColor.red
            yellowView.backgroundColor = UIColor.lightGray
            greenView.backgroundColor = UIColor.lightGray
            timeLabel.text = "\(time - yellow - green)"
            time -= 1
        }
        
        
    }
   


    @IBAction func resetPress(_ sender: Any) {
        redView.backgroundColor = UIColor.lightGray
        yellowView.backgroundColor = UIColor.lightGray
        greenView.backgroundColor = UIColor.lightGray
        time = yellow + green + red
        timeLabel.text = "0"
        timer.invalidate()
    }
    
    @IBAction func toFirstPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
