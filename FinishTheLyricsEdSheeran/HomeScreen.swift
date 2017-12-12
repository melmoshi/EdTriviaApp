//
//  ViewController.swift
//  EdSheeranTrivia
//
//  Created by Mel and Sand on 2017-06-13.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GoogleMobileAds


var levelChosen: Bool = true  //TRUE MEANS EASY
var questionsAllowed = 15
var gamesPlayed = 1



class HomeScreen: UIViewController, GADBannerViewDelegate {
 
    @IBOutlet weak var maxWarningBtn: RoundButton!

    @IBOutlet weak var edTestHeader: UILabel!
    
    @IBOutlet weak var bannerAd: GADBannerView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //THE FOLLOWING IS A TEST:
        //edTestHeader.text = "beyonce\u{0301}"
        
        loadRewardAd()
        
        if UserDefaults.standard.object(forKey: "lastSavedDate") == nil {
            print("There is no saved date on file")
            storeDate()
            gamesPlayed = 1
            storeGamesPlayed()
        } else {
            print("There is a date stored on Local Storage")
            if checkTodaysDate() == UserDefaults.standard.object(forKey: "lastSavedDate") as? String {
                print("You have already played today")
                if let x = UserDefaults.standard.object(forKey: "numberOfGamesPlayed") as? Int {
                    gamesPlayed = x
                    
                    if gamesPlayed > 3 {
                        maxWarningBtn.isHidden = false
                    }
                    
                    print("You have played \(gamesPlayed) games today")
                    
                }
                
            } else {
                print("You are playing for the first time today")
                gamesPlayed = 1
                storeGamesPlayed()
                storeDate()
            }
        }
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        if gamesPlayed > 3 {
             performSegue(withIdentifier: "maxWarningBtnSeque", sender: self)
        }
    }
    
    
    
    @IBAction func difficultyToggle(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            levelChosen = true  //(easy)
            print("Easy")
        }
        
        if sender.selectedSegmentIndex == 1 {
            levelChosen = false  //(hard)
            print("HArd")
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

func storeGamesPlayed() {
    UserDefaults.standard.set(gamesPlayed, forKey: "numberOfGamesPlayed")
}

func storeDate() {
    
    let date = NSDate()
    let calendar = NSCalendar.current
    let components = calendar.dateComponents([.day, .month, .year], from: date as Date)
    
    let todaysDate = "\(components.year!)-\(components.month!)-\(components.day!)"
    
    print(todaysDate)
    
    UserDefaults.standard.set(todaysDate, forKey: "lastSavedDate")
    
    print("Save date function has been ran!")
}

func checkTodaysDate() -> String {
    
    let date = NSDate()
    let calendar = NSCalendar.current
    let components = calendar.dateComponents([.day, .month, .year], from: date as Date)
    
    let todaysDate = "\(components.year!)-\(components.month!)-\(components.day!)"
    
    print("today's date is \(todaysDate)")
    
    return todaysDate
    
}
