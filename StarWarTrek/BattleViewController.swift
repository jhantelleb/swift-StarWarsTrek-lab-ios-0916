//
//  BattleViewController.swift
//  StarWarTrek
//
//  Created by Jhantelle Belleza on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class BattleViewController: UIViewController {
    @IBOutlet weak var starWarsImageView: UIImageView!
    @IBOutlet weak var starTrekImageView: UIImageView!
    
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsImageView.image? = starWarsImage
        starTrekImageView.image? = starTrekImage
        
        let imageViews = [starWarsImageView, starTrekImageView]
        
        for imageView in imageViews {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(startBattle))
         imageView?.addGestureRecognizer(panGestureRecognizer)
        }
    }

    func startBattle(_ sender: UIPanGestureRecognizer) {
        sender.view?.center = sender.location(in: view)

        if starWarsImageView.frame.intersects(starTrekImageView.frame) {
             self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
}


