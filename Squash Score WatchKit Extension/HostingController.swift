//
//  HostingController.swift
//  Squash Score WatchKit Extension
//
//  Created by James Cosgrove on 26/10/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<inMatchView> {
    override var body: inMatchView {
		return inMatchView(optionsData: OptionsData())
    }
}
