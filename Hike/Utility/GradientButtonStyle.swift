//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Leonardo Soares on 25/04/24.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Swift ternary condition operator
                // Condition ? A : B
                // A: When user pressed the Button
                // B: When the Button is not pressed
                
                configuration.isPressed ?
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}
