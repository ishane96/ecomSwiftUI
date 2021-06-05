//
//  Localizator.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import Foundation
import SwiftUI

public class Localizator {
    fileprivate func NSLocalizedString(_ key: String) -> String {
        return Foundation.NSLocalizedString(key, comment: "")
    }
}

extension String{
    // Alert titles
    static let Alert = NSLocalizedString("Alert", comment: "")
    static let Confirmation = NSLocalizedString("Log Out", comment: "")
    static let Error = NSLocalizedString("Error", comment: "")
    static let Incomplete = NSLocalizedString("Incomplete", comment: "")
    static let Success = NSLocalizedString("Success", comment: "")
    static let BookingConfirmed = NSLocalizedString("Booking has confirmed successfully", comment: "")
    static let BookingCancelled = NSLocalizedString("Booking has cancelled successfully", comment: "")
    static let Failed = NSLocalizedString("Failed", comment: "")
    static let Oops = NSLocalizedString("Oops", comment: "")
    static let Warning = NSLocalizedString("Warning", comment: "")
    static let ResetEmailSent = NSLocalizedString("A password reset link has been sent. Please check your email.", comment: "")
    static let SomethingWentWrong = NSLocalizedString("Something went wrong.", comment: "")
    
    
    // ALERT MESSAGES
    // Local error messages
    static let ErrorCorrupted = NSLocalizedString("Error is corrupted.", comment: "")
    static let MissingData = NSLocalizedString("Missing data in the request.", comment: "")
    static let AnyFieldEmpty = NSLocalizedString("All fields are required.", comment: "")
}
