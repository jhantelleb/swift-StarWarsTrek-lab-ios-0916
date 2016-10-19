//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var starTrekOne: UIImageView!
    @IBOutlet weak var starTrekTwo: UIImageView!
    @IBOutlet weak var starTrekThree: UIImageView!
    @IBOutlet weak var starTrekFour: UIImageView!
    
    @IBOutlet weak var starWarsOne: UIImageView!
    @IBOutlet weak var starWarsTwo: UIImageView!
    @IBOutlet weak var starWarsThree: UIImageView!
    @IBOutlet weak var starWarsFour: UIImageView!
    
    @IBOutlet weak var starTrekScrollView: UIScrollView!
    @IBOutlet weak var starWarsScrollView: UIScrollView!
    
    var starWarsCharacter: UIImageView!
    var starTrekCharacter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizers()
    }
    
    func setupGestureRecognizers() {
        let imageViews = [starWarsOne, starWarsTwo, starWarsThree, starWarsFour, starTrekOne, starTrekTwo, starTrekTwo, starTrekThree, starTrekFour]
        
        
        for i in 0..<imageViews.count {
            let gestureRecognizer = UITapGestureRecognizer(target: self,
                                            action: #selector(chosenCharacters(_:)))
            
            gestureRecognizer.numberOfTapsRequired = 2
            imageViews[i]?.addGestureRecognizer(gestureRecognizer)
            imageViews[i]?.isUserInteractionEnabled = true
            
            if i < 4 {
              imageViews[i]?.accessibilityIdentifier = "Star Wars"
            } else {
              imageViews[i]?.accessibilityIdentifier = "Star Trek"
            }
        }
    }

    func chosenCharacters(_ sender: UITapGestureRecognizer) {
        if sender.view?.accessibilityIdentifier == "Star Wars" {
           starWarsCharacter = sender.view as? UIImageView
            print(starWarsCharacter)
        } else {
           starTrekCharacter = sender.view as? UIImageView
            print(starTrekCharacter)
        }
        sender.view?.alpha = 0.7
        sender.view?.superview?.superview?.isUserInteractionEnabled = false
        
        checkForFight()
    }
    
    private func checkForFight() {
        if starWarsCharacter != nil &&
           starTrekCharacter != nil {
            performSegue(withIdentifier: "fightSegue", sender: nil)
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let battleViewController = segue.destination as? BattleViewController
        print(battleViewController)
        battleViewController?.starTrekImage = starTrekCharacter.image
        battleViewController?.starWarsImage = starWarsCharacter.image
    }
}


