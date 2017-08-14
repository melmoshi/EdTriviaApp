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

        //Greeting:
        if score < 0.4 {
            greeting.text = "Better Luck Next Time!"
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
        ofQuestions.text = "Of \(questionsAllowed) Questions"
    }
    
    
    func createAndLoadInterstitial() -> GADInterstitial {
        
        let request = GADRequest()
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-8878911622308650/7298635528")
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
                
                post.setInitialText("I scored \(points) of 25 points on 'Guess the Ed Sheeran Lyrics!'")
                post.add(UIImage(named: "img.jpg"))
                    //ADD IMAGE!!!
                
                self.present(post, animated: true, completion: nil)
                
                
                
                
            } else {
                //pop-up to say you're not connected!
                self.showAlert(service: "Facebook")
            }
            
        }
        
        //Second Action
        let actionTwo = UIAlertAction(title: "Share On Twitter", style: .default) {
            (action) in
            
            print("SUCCESS")
            
            //Checking if user has facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("I scored \(points) of 25 points on 'Guess the Ed Sheeran Lyrics!'")
                post.add(UIImage(named: "img.jpg"))
                //ADD IMAGE!!!
                
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
        
        if interstitialAd != nil {
            if interstitialAd!.isReady {
                interstitialAd?.present(fromRootViewController: self)
            }
        }
        
    }
    
    
    


}
