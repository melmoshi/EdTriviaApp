//
//  PointsScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import Social
import GoogleMobileAds


class PointsScreen: UIViewController, GADInterstitialDelegate {
    
    
    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var ofQuestions: UILabel!
    
    var score: Double = (Double(points)/Double(questionsAllowed))
    
    var interstitialAd: GADInterstitial?
    //Google Ads


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET-UP & CONFIGURE INTERSTITIAL AD:
        interstitialAd = createAndLoadInterstitial()

        print(score)
        
        //Greeting:
        if score < 0.4 {
            greeting.text = "Try Again!"
        } else if score >= 0.4 && score < 0.60 {
            greeting.text = "Good Effort!"
        } else if score >= 0.6 && score < 0.9 {
            greeting.text = "Nice Work!"
        } else if score >= 0.9 && score < 1 {
            greeting.text = "Awesome!"
        } else {
            greeting.text = "Perfect Score!"
        }
        
        //Points
        pointsLbl.text = String(points)
        
        //Of Questions
        ofQuestions.text = "Of \(questionsAllowed) Questions!"
    }
    
    
    func createAndLoadInterstitial() -> GADInterstitial {
        
        let request = GADRequest()
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-8878911622308650/3551063242")
        request.testDevices = [kGADSimulatorID]
        interstitial.delegate = self
        interstitial.load(request)
        
        
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitialAd = createAndLoadInterstitial()
        //Resets the "Try Again" pressed count to zero
        
        performSegue(withIdentifier: "TryAgainSegue", sender: Any.self)
    }
    
    

        //SOCIAL SHARING
    @IBAction func sharePressed(_ sender: Any) {
        
        //Alert
        let alert = UIAlertController(title: "Share Your Score!", message: "Share your Score and Compete with your Friends!", preferredStyle: .actionSheet)
        
        
        //First action
        let actionOne = UIAlertAction(title: "Share On Facebook", style: .default) {
            (action) in
            
            print("SUCCESS")
            
            //Checking if user has facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("I scored \(points) out of \(questionsAllowed) points on 'Beyonce Trivia!")
                
                if self.score < 0.45 {
                    post.add(UIImage(named: "General.jpg"))
                } else if self.score >= 0.45 && self.score < 0.50 {
                    post.add(UIImage(named: "50.jpg"))
                } else if self.score >= 0.50 && self.score < 0.55 {
                    post.add(UIImage(named: "55.jpg"))
                } else if self.score >= 0.55 && self.score < 0.60 {
                    post.add(UIImage(named: "60.jpg"))
                } else if self.score >= 0.60 && self.score < 0.65 {
                    post.add(UIImage(named: "65.jpg"))
                } else if self.score >= 0.65 && self.score < 0.70 {
                    post.add(UIImage(named: "70.jpg"))
                } else if self.score >= 0.70 && self.score < 0.75 {
                    post.add(UIImage(named: "75.jpg"))
                } else if self.score >= 0.75 && self.score < 0.80 {
                    post.add(UIImage(named: "80.jpg"))
                } else if self.score >= 0.80 && self.score < 0.85 {
                    post.add(UIImage(named: "85.jpg"))
                } else if self.score >= 0.85 && self.score < 0.90 {
                    post.add(UIImage(named: "90.jpg"))
                } else if self.score >= 0.90 && self.score < 0.93 {
                    post.add(UIImage(named: "93.jpg"))
                } else if self.score >= 0.93 && self.score < 0.98 {
                    post.add(UIImage(named: "95.jpg"))
                } else if self.score == 1.0 {
                    post.add(UIImage(named: "100.jpg"))
                } else {
                    post.add(UIImage(named: "General.jpg"))
                }
                
                //pop-up to say you're not connected!
                self.showAlert(service: "Facebook")
            }
            
        }
        
        //Second Action
        let actionTwo = UIAlertAction(title: "Share On Twitter", style: .default) {
            (action) in
            
            print("SUCCESS")
            
            //Checking if user has twitter
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("I scored \(points) out of \(questionsAllowed) points on 'Beyonce Trivia!")
                
                
                if self.score < 0.45 {
                    post.add(UIImage(named: "General.jpg"))
                } else if self.score >= 0.45 && self.score < 0.50 {
                    post.add(UIImage(named: "50.jpg"))
                } else if self.score >= 0.50 && self.score < 0.55 {
                    post.add(UIImage(named: "55.jpg"))
                } else if self.score >= 0.55 && self.score < 0.60 {
                    post.add(UIImage(named: "60.jpg"))
                } else if self.score >= 0.60 && self.score < 0.65 {
                    post.add(UIImage(named: "65.jpg"))
                } else if self.score >= 0.65 && self.score < 0.70 {
                    post.add(UIImage(named: "70.jpg"))
                } else if self.score >= 0.70 && self.score < 0.75 {
                    post.add(UIImage(named: "75.jpg"))
                } else if self.score >= 0.75 && self.score < 0.80 {
                    post.add(UIImage(named: "80.jpg"))
                } else if self.score >= 0.80 && self.score < 0.85 {
                    post.add(UIImage(named: "85.jpg"))
                } else if self.score >= 0.85 && self.score < 0.90 {
                    post.add(UIImage(named: "90.jpg"))
                } else if self.score >= 0.90 && self.score < 0.93 {
                    post.add(UIImage(named: "93.jpg"))
                } else if self.score >= 0.93 && self.score < 0.98 {
                    post.add(UIImage(named: "95.jpg"))
                } else if self.score == 1.0 {
                    post.add(UIImage(named: "100.jpg"))
                } else {
                    post.add(UIImage(named: "General.jpg"))
                }
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                //pop-up to say you're not connected!
                self.showAlert(service: "Twitter")
            }
            
        }
        
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present Alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showAlert(service: String) {
        
        let alert = UIAlertController(title: "Sorry!", message: "This device is not connected to \(service)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        
        questions = []
        newArray = []
        print("You have played \(gamesPlayed) games.")
        gamesPlayed += 1
        storeGamesPlayed()
        print("You about to play game #\(gamesPlayed)")
        
        if gamesPlayed != 3 {
        if interstitialAd != nil {
            if interstitialAd!.isReady {
                interstitialAd?.present(fromRootViewController: self)
            } else { performSegue(withIdentifier: "TryAgainSegue", sender: self) }
        } else { performSegue(withIdentifier: "TryAgainSegue", sender: self) }
        } else { performSegue(withIdentifier: "TryAgainSegue", sender: self) }
    }
    

    
    
    


}
