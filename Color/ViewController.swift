//
//  ViewController.swift
//  Color
//
//  Created by Steve on 2/12/18.
//  Copyright © 2018 Steve. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var darkBlueBG: UIView!
    @IBOutlet var powerButton: UIButton!
    @IBOutlet var cloudHolder: UIView!
    
    
    @IBOutlet var rocketStream: UIImageView!
    @IBOutlet var launchMode: UILabel!
    @IBOutlet var onMode: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func launchAction(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = false
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketStream.frame = CGRect(x: 0, y: 40, width: 375, height: 572)
        }) { (finished) in
            self.launchMode.isHidden = false
            self.onMode.isHidden = false
        }
    }
    
//    @IBDesignable class IButton: UIButton
//    {
//        override func layoutSubviews() {
//            super.layoutSubviews()
//
//            updateCornerRadius()
//        }
//
//        @IBInspectable var rounded: Bool = false {
//            didSet {
//                updateCornerRadius()
//            }
//        }
//
//        func updateCornerRadius() {
//            layer.cornerRadius = rounded ? frame.size.height / 2 : 0
//        }
//    }
    
//    var isPurple = false
//    @IBAction func changeMode(_ sender: Any) {
//        if isPurple {
//            view.backgroundColor = UIColor.white
//            isPurple = false
//        } else {
//            view.backgroundColor = UIColor.purple
//            isPurple = true
//        }
//    }
}

