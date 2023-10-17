//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2023 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


open class SpeziSceneDelegate: NSObject, UISceneDelegate, UIWindowSceneDelegate {
    public var window: UIWindow?
    public func sceneWillEnterForeground(_ scene: UIScene) {
        guard let delegate = SpeziAppDelegate.appDelegate else {
            return
        }
        delegate.sceneWillEnterForeground(scene)
    }
    
    public func sceneDidBecomeActive(_ scene: UIScene) {
        guard let delegate = SpeziAppDelegate.appDelegate else {
            return
        }
        delegate.sceneDidBecomeActive(scene)
    }
    
    public func sceneWillResignActive(_ scene: UIScene) {
        guard let delegate = SpeziAppDelegate.appDelegate else {
            return
        }
        delegate.sceneWillResignActive(scene)
    }
    
    public func sceneDidEnterBackground(_ scene: UIScene) {
        guard let delegate = SpeziAppDelegate.appDelegate else {
            return
        }
        delegate.sceneDidEnterBackground(scene)
    }
}
