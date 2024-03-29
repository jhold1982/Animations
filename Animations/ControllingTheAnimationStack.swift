//
//  ControllingTheAnimationStack.swift
//  Animations
//
//  Created by Justin Hold on 2/28/23.
//

import SwiftUI

struct ControllingTheAnimationStack: View {
	@State private var animationAmount = 0.0
	@State private var enabled = false
    var body: some View {
		Button("Tap Me") {
			enabled.toggle()
		}
		.frame(width: 200, height: 200)
		.background(enabled ? .blue : .red)
		.animation(nil, value: enabled)
		.foregroundColor(.white)
		.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//		.animation(.default, value: enabled)
		.animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct ControllingTheAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllingTheAnimationStack()
    }
}
