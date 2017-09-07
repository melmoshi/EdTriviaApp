//
//  TryAgainScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-18.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GameKit
import StoreKit
import GoogleMobileAds




    //Default Values for questionsAllowed and levelChosen?

class TryAgainScreen: UIViewController, GADRewardBasedVideoAdDelegate {
    
    
    /// Tells the delegate that the reward based video ad has rewarded the user.
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        reward.r
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("AD RECIEVED")
    }

    
    @IBOutlet weak var factLbl: UILabel!
    
    override func viewDidLoad() {
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        //setting up reward ad delegate
        
        super.viewDidLoad()
        
        loadRewardAd() 
        
        gameDefualtSettings()
        
        factLbl.text = factArray[randomNumFact()]
        
        if gamesPlayed == 3 {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
            }
        }
        

        
    }


    @IBAction func difficultyToggle2(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            levelChosen = true
        }
        
        if sender.selectedSegmentIndex == 1 {
            levelChosen = false
        }
    }
    
    @IBAction func numberQuestionsToggle2(_ sender: UISegmentedControl) {
        
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
    
    @IBAction func startBtnPressed(_ sender: Any) {
        
        ///Reward Video Here:
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        } else {
            print("NOT READY")
            performSegue(withIdentifier: "RestartSegue", sender: self)
        }
        

        
    }
    

    func gameDefualtSettings() {
        levelChosen = true
        questionsAllowed = 15
    }
    
    func randomNumFact() -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: factArray.count)
        
        return randomNumber
        
        //Creates a random number to call from factArray
    }
    
    func loadRewardAd() {
        
        
        
        if !GADRewardBasedVideoAd.sharedInstance().isReady {
            print("STARTING LOAD")
            let requestReward = GADRequest()
            requestReward.testDevices = [kGADSimulatorID]
            GADRewardBasedVideoAd.sharedInstance().load(requestReward, withAdUnitID: "ca-app-pub-8878911622308650/8097706161")
        }
    }    
    
    
}

