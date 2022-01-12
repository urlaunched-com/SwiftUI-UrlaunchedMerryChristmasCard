//
//  SnowflakesView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 29/12/2021.
//

import SwiftUI

struct SnowflakesView: View {
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image("christmas-tree")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 450)
                .padding(.bottom, 150)
                .padding(.trailing, 30)
            VStack {
                HStack {
                    Snowflake(width: randomSize(), height: randomSize())
                        .padding(.trailing, 30)
                        .padding(.bottom , 20)
                    Snowflake(width: randomSize(), height: randomSize())
                    Spacer()
                    Snowflake(width: randomSize(), height: randomSize())
                    
                }
                Snowflake(width: randomSize(), height: randomSize())
                HStack {
                    Spacer()
                    Snowflake(width: randomSize(), height: randomSize())
                    Spacer()
                    Snowflake(width: randomSize(), height: randomSize())
                        .padding(.trailing, 30)
                        .padding(.bottom , 50)
                    Snowflake(width: randomSize(), height: randomSize())
                    
                }
                Spacer()
                Snowflake(width: randomSize(), height: randomSize())
                    .padding(.trailing, 80)
                HStack {
                    Snowflake(width: randomSize(), height: randomSize())
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Snowflake(width: randomSize(), height: randomSize())
                        .padding(.top, 20)
                    Spacer()
                    
                    Snowflake(width: randomSize(), height: randomSize())
                }
            }
        }
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 40...100))
    }
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
}

private extension SnowflakesView {
    struct Snowflake: View {
        let width: CGFloat
        let height: CGFloat
        
        @State private var isAnimating: Bool = false
        
        var body: some View {
            Image("snowflakes")
                .resizable()
                .aspectRatio(0.9,contentMode: .fit)
                .frame(width: width, height: height)
                .rotationEffect(Angle.degrees(isAnimating ? 360 : 0))
                .onAppear(perform: {
                    withAnimation(Animation.linear(duration: 5.0).speed(0.8).repeatForever(autoreverses: false)) {
                        isAnimating = true
                    }
                })
        }
    }
}

struct SnowflakesView_Previews: PreviewProvider {
    static var previews: some View {
        SnowflakesView()
    }
}
