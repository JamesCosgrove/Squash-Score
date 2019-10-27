//
//  OptionsData.swift
//  Squash Score
//
//  Created by James Cosgrove on 27/10/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI
import Combine


final class OptionsData: ObservableObject {
    @Published var twoClearPoint = false
    @Published var setPoints: Int = 9
    @Published var numberOfSets: Int = 3
}
