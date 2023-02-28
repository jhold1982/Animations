//
//  AnimatingGestures2.swift
//  Animations
//
//  Created by Justin Hold on 2/28/23.
//

import SwiftUI

struct AnimatingGestures2: View {
	let letters = Array("Hello, SwiftUI")
	@State private var enabled = false
	@State private var dragAmount = CGSize.zero
    var body: some View {
		HStack(spacing: 0) {
			ForEach(0..<letters.count) { number in
				Text(String(letters[number]))
					.padding(5)
					.font(.title)
					.background(enabled ? .blue : .red)
					.offset(dragAmount)
					.animation(
						.default.delay(Double(number) / 20),
						value: dragAmount
					)
			}
		}
		.gesture(
			DragGesture()
				.onChanged { dragAmount = $0.translation }
				.onEnded { _ in
					dragAmount = .zero
						enabled.toggle()
				}
		)
    }
}

struct AnimatingGestures2_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures2()
    }
}
