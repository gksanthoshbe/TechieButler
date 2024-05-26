//
//  ApplicationExtenstion.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import UIKit

// MARK: - UIApplication extension

extension UIApplication {
     func dismissKeyboard() {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
 }
