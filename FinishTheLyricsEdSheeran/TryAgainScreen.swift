//
//  TryAgainScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-18.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GameKit


    //Default Values for questionsAllowed and levelChosen?

class TryAgainScreen: UIViewController {
    
    @IBOutlet weak var factLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDefualtSettings()
        
        factLbl.text = factArray[randomNumFact()]
    }


    @IBAction func difficultyToggle2(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            levelChosen = "Easy"
        }
        
        if sender.selectedSegmentIndex == 1 {
            levelChosen = "Hard"
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

    func gameDefualtSettings() {
        levelChosen = "Easy"
        questionsAllowed = 15
    }
    
    func randomNumFact() -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: factArray.count)
        
        return randomNumber
        
        //Creates a random number to call from factArray
    }
    
}
