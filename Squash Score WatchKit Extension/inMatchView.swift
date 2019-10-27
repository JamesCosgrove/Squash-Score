//
//  ContentView.swift
//  Squash Score WatchKit Extension
//
//  Created by James Cosgrove on 26/10/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct inMatchView: View {
	
	@State var youScore: Int = 0
	@State var opponentScore: Int = 0
	@State var youServe: Bool = true
	@State var scoresArray: [[Int]] = [[]]
	
	@ObservedObject var optionsData: OptionsData
	

    var body: some View {
		VStack {
			Spacer()
			HStack {

					ZStack {
						Rectangle()
							.foregroundColor(.green)
							.cornerRadius(10)
						VStack {
							Button(action: {
								if self.youServe {
									self.youScore += 1
									if self.youScore >= self.optionsData.setPoints {
										self.youScore = 0
										self.opponentScore = 0
									}
								}
								else {
									self.youServe.toggle()
								}
								
								
							}, label: {
								Image(systemName: youServe ? "\(youScore).square.fill" : "\(youScore).square")
								.imageScale(.large)
								.font(Font.title.bold())
							}).frame(width: 50, height: 10, alignment: .center)
						}
					}

					ZStack {
						Rectangle()
							.foregroundColor(.gray)
							.cornerRadius(10)
						VStack {
							Button(action: {
								if !self.youServe {
									self.opponentScore += 1
									if self.opponentScore >= self.optionsData.setPoints {
										self.youScore = 0
										self.opponentScore = 0
									}
								}
								else {
									self.youServe.toggle()
								}
							}, label: {
								Image(systemName: youServe ? "\(opponentScore).square" : "\(opponentScore).square.fill")
								.imageScale(.large)
								.font(Font.title.bold())
							}).frame(width: 50, height: 10, alignment: .center)
						}
					}



			}
		}
    }
}
struct youRectangle: View {
	var youScore: Int
	var youServe: Bool
	var color: Color
	var cornerRadius: CGFloat
	var body: some View {
		ZStack {
			Rectangle()
				.foregroundColor(color)
				.cornerRadius(cornerRadius)
			VStack {
				Button(action: {
					print("here")
				}, label: {
					Image(systemName: youServe ? "\(youScore).circle.fill" : "\(youScore).circle")
					.imageScale(.large)
					.font(Font.title.bold())
				})
				
			}
		}
	}
}

struct opponentRectangle: View {
	var opponentScore: Int
	var youServe: Bool
	var color: Color
	var cornerRadius: CGFloat
	var body: some View {
		ZStack {
			Rectangle()
				.foregroundColor(color)
				.cornerRadius(cornerRadius)
			VStack {
				Image(systemName: youServe ? "\(opponentScore).circle" : "\(opponentScore).circle.fill")
					.imageScale(.large)
					.font(Font.title.bold())
			}
		}
	}
}

struct inMatchView_Previews: PreviewProvider {
    static var previews: some View {
		return Group {
			inMatchView(optionsData: OptionsData()).previewDevice("Apple Watch Series 2 - 38mm")
			
			inMatchView(optionsData: OptionsData()).previewDevice("Apple Watch Series 5 - 44mm")
		}

        
    }
}
