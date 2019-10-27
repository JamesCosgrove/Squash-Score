//
//  OptionsView.swift
//  Squash Score
//
//  Created by James Cosgrove on 26/10/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI




struct OptionsView: View {
	
	
    @State private var twoClearPoint: Bool = true
    @State public var setPoints: Int = 9
	@State private var numberOfSets: Int = 3
	
    var body: some View {
		
		ZStack {
			
			NavigationView {
				Form {
						Section(header: Text("POINTS"), footer: Text("Each set will have \(setPoints) points.")) {
							Stepper(value: $setPoints, in: 1...20) {
								Text("Points Per Set")
							}
						}
						Section(footer: Text("To win a set you must have a two point lead over your opponent.")) {
							Toggle(isOn: $twoClearPoint) {
								Text("Two Point Difference to Win")
							}
						}
					Section(header: Text("SETS"), footer: Text("Each game will have \(numberOfSets) sets.")) {
							Stepper(value: $numberOfSets, in: 1...11) {
								Text("Sets Per Game")
							}
						}
					}//.listStyle(GroupedListStyle())
					.navigationBarTitle("Options")
			}
				
			
			VStack {
				Handle()
					.padding(8)
				Spacer()
				
			}
			
		}
				
		
    }
}

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
	
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
