//
//  AnimationBindings.swift
//  Animations
//
//  Created by Justin Hold on 2/27/23.
//

import SwiftUI

struct AnimationBindings: View {
	@State private var animationAmount = 1.0
    var body: some View {
		VStack {
			Stepper("Scale amount", value: $animationAmount.animation(
				.easeInOut(duration: 1)
					.repeatCount(3, autoreverses: true)
			), in: 1...10)
			Spacer()
			Button("Tap me") {
				animationAmount += 1
			}
			.padding(50)
			.background(.mint)
			.foregroundColor(.white)
			.clipShape(Capsule())
			.scaleEffect(animationAmount)
		}
    }
}

struct AnimationBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindings()
    }
}
