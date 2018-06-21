//
//  ViewController.swift
//  PatienceGuru
//
//  Created by Raman Singh on 2018-06-20.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController {

    @IBOutlet var onboardingView: OnboardingView!
    @IBOutlet var getStartedOutlet: UIButton!
    
    var backgroundColorArray = [UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1), UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1), UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        self.view.backgroundColor = backgroundColorArray[0]
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "onboardingComplete")
        userDefaults.synchronize()
    }
    


}


extension ViewController: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)
        
        return [
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "goals"),
                               title: "Goals",
                               description: "Reaching your goals require dedication and patience.",
                               pageIcon: #imageLiteral(resourceName: "Oval"),
                               color: backgroundColorArray[index],
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "productive"),
                               title: "Productivity",
                               description: "To be productive is to be able to do what is needed, and that requires self control, and patience.",
                               pageIcon: #imageLiteral(resourceName: "Oval"),
                               color: backgroundColorArray[index],
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont!),
            
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "pin"),
                               title: "Dedication",
                               description: "Dedication is a learned behaviour. The more you are able to control your impulses to do something else, the more dedicated you are.",
                               pageIcon: #imageLiteral(resourceName: "Oval"),
                               color: backgroundColorArray[index],
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont!)
            ][index]
    }
}

extension ViewController: PaperOnboardingDelegate {
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        self.view.backgroundColor = backgroundColorArray[index]
        if index != 2 {
           UIView.animate(withDuration: 0.2, animations: {
            self.getStartedOutlet.alpha = 0
           })
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedOutlet.alpha = 1
            })
        }
    }
    
}

