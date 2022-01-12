//
//  ChristmasView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 28/12/2021.
//

import SwiftUI
import AVFoundation

struct ChristmasView: View {
    var nameSpace: Namespace.ID
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isShowed: Bool = false
    @State private var isSecondShowed: Bool = false
    @State private var isThirdShowed: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    VStack {
                        ScaleText("Merry", delay: 1)
                        ScaleText("Christmas", delay: 1)
                    }
                    Spacer()
                }
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "logo", in: nameSpace)
                    .frame(width: 240, height: 128)
            }
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image("background1")
                        .resizable()
                    SnowView()
                    SnowflakesView()
                }
                    .edgesIgnoringSafeArea(.all)
            )
            .padding(.horizontal, 10)
            .onAppear(perform: {
                playSound()
                withAnimation(Animation.easeInOut(duration: 6.0).repeatCount(1, autoreverses: false).delay(8.5)) {
                    isShowed = true
                }
                
                withAnimation(Animation.easeInOut(duration: 6.0).repeatCount(1, autoreverses: false).delay(15)) {
                    isSecondShowed = true
                }
                
                withAnimation(Animation.easeInOut(duration: 6.0).repeatCount(1, autoreverses: false).delay(21)) {
                    isThirdShowed = true
                }
            })
            SantaView(isShowed: $isShowed)
            SantaSecondView(isShowed: $isSecondShowed)
            SantaThirdView(isShowed: $isThirdShowed)
        }
    }
}

private extension ChristmasView {
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "We Wish You a Merry Christmas Original Song and Carol with Lyrics.wav", withExtension: nil) else {
            fatalError("Unable to find \("We Wish You a Merry Christmas Original Song and Carol with Lyrics.wav") in bundle")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.volume = 0.3
        audioPlayer.play()
    }
}

struct ChristmasView_Previews: PreviewProvider {
    static var previews: some View {
        ChristmasView(nameSpace: Namespace().wrappedValue)
    }
}
