//
//  HapticsManager.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 01/10/2025.
//

import Foundation
import UIKit

fileprivate final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private let feedback = UINotificationFeedbackGenerator()
    
    private init() {}
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    if UserDefaults.standard.bool(forKey: UserDefaultsKey.hapticsEnabled){
        HapticsManager.shared.trigger(notification)
    }
}
