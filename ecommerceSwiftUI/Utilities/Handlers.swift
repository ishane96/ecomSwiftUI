//
//  Handlers.swift
//  SwiftUI
//
//  Created by Achintha Kahawalage on 2/13/21.
//

import Foundation

typealias ActionHandler = (_ status: Bool, _ message: String) -> ()
typealias CompletionHandler = (_ status: Bool, _ code: Int, _ message: String) -> ()
typealias CompletionHandlerWithData = (_ status: Bool, _ code: Int, _ message: String, _ data: Any?) -> ()
typealias FileDownloadHandler = (_ status: Bool, _ message: String, _ url: String?) -> ()

func delay(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}




