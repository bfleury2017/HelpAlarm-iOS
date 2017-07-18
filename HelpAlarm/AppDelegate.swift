//
//  AppDelegate.swift
//  Accelerometer
//
//  Created by Brian on 3/21/17.
//  Copyright © 2017 NHTI. All rights reserved.
//

import UIKit
import MediaPlayer
import AudioToolbox
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        start()
        
        return true
    }


    func start() {
        let volumeView = MPVolumeView()
        if let view = volumeView.subviews.first as? UISlider {
            //set system volume to max level
            view.value = 1.0
        }
        
        let filename = "raid"
        let ext = "m4a"
        
        let soundUrl = Bundle.main.url(forResource: filename, withExtension: ext)
            var soundId: SystemSoundID = 0
            
            AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
            
            AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (soundId, clientData) -> Void in
                AudioServicesDisposeSystemSoundID(soundId)
            }, nil)
            
            AudioServicesPlaySystemSound(soundId)
            
        
        
//        if let soundUrl = Bundle.main.url(forResource: filename, withExtension: ext) {
//            var soundId: SystemSoundID = 0
//            
//            AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundId)
//            
//            AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (soundId, clientData) -> Void in
//                AudioServicesDisposeSystemSoundID(soundId)
//            }, nil)
//            
//            AudioServicesPlaySystemSound(soundId)
//
//        }
        
        guard let number = URL(string: "tel://6032304000") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(number)
        }

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let volumeView = MPVolumeView()
        if let view = volumeView.subviews.first as? UISlider {
            //set system volume to max level
            view.value = 0.3
        }

    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        start()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

}

