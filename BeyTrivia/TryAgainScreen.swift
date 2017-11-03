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

var videoWatched = false

class TryAgainScreen: UIViewController, GADRewardBasedVideoAdDelegate {
    
    //REWARD AD FUNCTIONS:
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("AD RECIEVED")
    }
    
        // Tells the delegate that the reward based video ad has rewarded the user.
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("REWARD RECIEVED WITH CURRENCY: \(reward.type), amount \(reward.amount).")
        loadRewardAd()
        videoWatched = true
        animateOut()
    }
    
        //What happens when closing the ad
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("AD HAS BEEN CLOSED")
        loadRewardAd()
        animateOut()
        
    }

    
    @IBOutlet weak var factLbl: UILabel!
    
    @IBOutlet var popUp: UIView!
    
    @IBOutlet var errorHandleView: UIView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var edPhoto: UIImageView!
    
    var effect: UIVisualEffect!
    
    
    
    
    override func viewDidLoad() {
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        loadRewardAd()
      //setting up reward ad delegate
        
        popUp.layer.cornerRadius = 5
        errorHandleView.layer.cornerRadius = 5
        
        edPhoto.layer.cornerRadius = 5
        edPhoto.clipsToBounds = true
        
        effect = visualEffectView.effect
        
        
        super.viewDidLoad()
        
        videoWatched = false
        
        gameDefualtSettings()
        factLbl.text = factArray[randomNumFact()]
        
        
        //ASKING FOR REVIEW
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
        
        if videoWatched == true {
            performSegue(withIdentifier: "RestartSegue", sender: self)
        } else {
            if gamesPlayed > 3 {
               animateIn()
            } else {
                performSegue(withIdentifier: "RestartSegue", sender: self)
            }
        }
    }
    
    @IBAction func watchVideoBtn(_ sender: Any) {
        
        ///Reward Video Here:
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        } else {
            print("NOT READY")
            videoErrorHandle()
        }
    }
    
    @IBAction func exitAppBtn(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func moreTriviaBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "RestartSegue", sender: self)
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
    
    

    
    
    func animateIn() {
        visualEffectView.isHidden = false
        self.view.addSubview(popUp)
        popUp.center = self.view.center
        
        popUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUp.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.popUp.alpha = 1
            self.popUp.transform = CGAffineTransform.identity
        }
        
        
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUp.alpha = 0
            
            self.visualEffectView.isHidden = true
        }) { (success:Bool) in
            self.popUp.removeFromSuperview()
        }
    }
    
    func videoErrorHandle() {
        
        animateOut()
        
        visualEffectView.isHidden = false
        self.view.addSubview(errorHandleView)
        errorHandleView.center = self.view.center
        
        errorHandleView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        errorHandleView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.errorHandleView.alpha = 1
            self.errorHandleView.transform = CGAffineTransform.identity
        }
        
    }
    
    
}

func loadRewardAd() {
    
    if !GADRewardBasedVideoAd.sharedInstance().isReady {
        print("STARTING LOAD")
        let requestReward = GADRequest()
        requestReward.testDevices = [kGADSimulatorID]
        GADRewardBasedVideoAd.sharedInstance().load(requestReward, withAdUnitID: "ca-app-pub-8878911622308650/5235741044")
    }
}


