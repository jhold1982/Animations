//
//  CustomTransitionsViewModifier.swift
//  Animations
//
//  Created by Justin Hold on 2/28/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
	let amount: Double
	let anchor: UnitPoint
	
	func body(content: Content) -> some View {
		content
			.rotationEffect(.degrees(amount), anchor: anchor)
			.clipped()
	}
}

extension AnyTransition {
	static var pivot: AnyTransition {
		.modifier(
			active: CornerRotateModifier(amount: -90, anchor: .topLeading),
			identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
		)
	}
}

struct CustomTransitionsViewModifier: View {
	@State private var isShowingRed = false
    var body: some View {
		ZStack {
			Rectangle()
				.fill(.blue)
				.frame(width: 200, height: 200)
			
			if isShowingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					.transition(.pivot)
			}
		}
		.onTapGesture {
			withAnimation {
				isShowingRed.toggle()
			}
		}
    }
}

struct CustomTransitionsViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionsViewModifier()
    }
}
