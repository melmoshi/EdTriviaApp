//
//  ViewController.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-13.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GoogleMobileAds


var levelChosen = "Easy"
var questionsAllowed = 15

class HomeScreen: UIViewController, GADBannerViewDelegate {
    
    
    @IBOutlet weak var bannerAd: GADBannerView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //BANNER AD:
        // Request
        let requestBanner = GADRequest()
        requestBanner.testDevices = [kGADSimulatorID]
        
        //Set Up Ad
        bannerAd.adUnitID = "ca-app-pub-8878911622308650/3001363526"
        
        //Making view controller responsible for ad unit
        bannerAd.rootViewController = self
        bannerAd.delegate = self
        
        bannerAd.load(requestBanner)
        //
    }
    
    
    
    @IBAction func difficultyToggle(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            levelChosen = "Easy"
        }
        
        if sender.selectedSegmentIndex == 1 {
            levelChosen = "Hard"
        }
    }
    
    
    @IBAction func questionNumberToggle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            questionsAllowed = 10
        } else if sender.selectedSegmentIndex == 1 {
            questionsAllowed = 15
        } else if sender.selectedSegmentIndex == 2 {
            questionsAllowed = 20
        } else if sender.selectedSegmentIndex == 3 {
            questionsAllowed = 25
        }
    }

}



