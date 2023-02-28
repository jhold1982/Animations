//
//  ShowHideViewsWithTransitions.swift
//  Animations
//
//  Created by Justin Hold on 2/28/23.
//

import SwiftUI

struct ShowHideViewsWithTransitions: View {
	@State private var isShowingRed = false
    var body: some View {
		VStack {
			Button("Tap Me") {
				withAnimation {
					isShowingRed.toggle()
				}
			}
			if isShowingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					.transition(.asymmetric(insertion: .scale, removal: .opacity))
			}
		}
    }
}

struct ShowHideViewsWithTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideViewsWithTransitions()
    }
}
