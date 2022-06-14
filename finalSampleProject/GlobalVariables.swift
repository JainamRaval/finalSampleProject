//
//  GlobalVariables.swift
//  finalSampleProject
//
//  Created by Jainam Raval on 13/06/22.
//

import UIKit


var safeArea:UILayoutGuide!

let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

let fileURL = url.appendingPathComponent("users.plist")
