//
//  ContentView.swift
//  Squash Score
//
//  Created by James Cosgrove on 26/10/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showOptions: Bool = false
	
    var body: some View {
		NavigationView {
			
			VStack {
				MatchesView()
			}.navigationBarTitle("Matches")
			.navigationBarItems(trailing: Button(action: {
					print("Button Pushed")
					self.showOptions = true
				})
				{
					Image(systemName: "gear")
						.imageScale(.large)
			}.sheet(isPresented: self.$showOptions) {
					OptionsView()
				}
			)
			
		}.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
