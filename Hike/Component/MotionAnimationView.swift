//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Leonardo Soares on 25/04/24.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        CGFloat.random(in: 4...80)
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: 0.25,
                                damping: 0.35
                            )
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup() // Hight performance
    }
}

#Preview {
    MotionAnimationView()
        .background(Circle().fill(.teal))
}
