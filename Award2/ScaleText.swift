//
//  ScaleText.swift
//  Award2
//
//  Created by Yurii Sameliuk on 28/12/2021.
//

import SwiftUI

struct ScaleText: View {
    let text: String
    var size: CGFloat
    let delay: CGFloat
    
    init(_ text: String, size: CGFloat = 37, delay: CGFloat) {
        self.text = text
        self.size = size
        self.delay = delay
    }
    
    @State private var flag1: Bool = false
    
    var body: some View {
        Text(text)
            .foregroundColor(Color.clear)
            .modifier(WaveTextModifier(text: text, waveWidth: 5, pct: flag1 ? 1 : 0.0, size: size))
            .rotationEffect(Angle(degrees: -7))
            .onAppear {
                withAnimation(Animation.linear(duration: 2.0).delay(delay).repeatForever(autoreverses: false)) {
                    flag1.toggle()
                }
            }
    }
    
    struct WaveTextModifier: AnimatableModifier {
        let text: String
        let waveWidth: Int
        var pct: Double
        var size: CGFloat
        
        var animatableData: Double {
            get { pct }
            set { pct = newValue }
        }
        
        func body(content: Content) -> some View {
            HStack(spacing: 5) {
                ForEach(Array(text.enumerated()), id: \.0) { (n, ch) in
                    Text(String(ch))
                        .font(Font.custom("Chalkduster", size: self.size).bold())
                        .foregroundColor(self.effect(self.pct, n , self.text.count, Double(self.waveWidth)) == 1 ? .white : .yellow)
                        .scaleEffect(self.effect(self.pct, n , self.text.count, Double(self.waveWidth)))
                }
            }
        }
        
        func effect(_ pct: Double, _ n: Int, _ total: Int, _ waveWidth: Double) -> CGFloat {
            let n = Double(n)
            let total = Double(total)
            return CGFloat(1 + valueInCurve(pct: pct, total: total, x: n/total, waveWidth: waveWidth))
        }
        
        func valueInCurve(pct: Double, total: Double, x: Double, waveWidth: Double) -> Double {
            let chunk = waveWidth / total
            let m = 1 / chunk
            let offset = (chunk - (1 / total)) * pct
            let lowerLimit = (pct - chunk) + offset
            let upperLimit = (pct) + offset
            
            guard x >= lowerLimit && x < upperLimit else { return 0 }
            
            let angle = ((x - pct - offset) * m)*360-90
            
            return (sin(angle * .pi / 180) + 1) / 2
        }
    }
}
