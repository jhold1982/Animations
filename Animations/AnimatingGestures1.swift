//
//  AnimatingGestures.swift
//  Animations
//
//  Created by Justin Hold on 2/28/23.
//

import SwiftUI

struct AnimatingGestures1: View {
	@State private var dragAmount = CGSize.zero
    var body: some View {
		LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
			.frame(width: 300, height: 200)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			.offset(dragAmount)
			.gesture(
				DragGesture()
					.onChanged { dragAmount = $0.translation }
					.onEnded { _ in
						withAnimation {
							dragAmount = .zero
						}
					}
			)
    }
}

struct AnimatingGestures1_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures1()
    }
}
