//
//  LaunchView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 28/12/2021.
//

import SwiftUI
import AVFoundation

struct LaunchView: View {
    var nameSpace: Namespace.ID
    
    @State private var isHatShowed: Bool = false
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "logo", in: nameSpace)
                .frame(width: 240, height: 128)
                .padding(.bottom, isHatShowed ? 14 : 14)
            
            if isHatShowed {
                Image("Santa-Claus-Hat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "hat", in: nameSpace)
                    .frame(width: 240, height: 60, alignment: .topLeading)
                    .padding(.bottom, 70)
                    .padding(.trailing, 30)
            }
        }
        .overlay(
            Group {
                if !isHatShowed {
                    Image("Santa-Claus-Hat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "hat", in: nameSpace)
                        .padding(.bottom, 50)
                        .frame(width: 240, height: 60, alignment: .topLeading)
                        .padding(.trailing, 30)
                }
            },
            alignment: .top)
        .onAppear {
            withAnimation(.easeIn(duration: 0.4).speed(0.8)) {
                isHatShowed.toggle()
                playSound()
            }
        }
        .onDisappear {
            audioPlayer.stop()
        }
    }
}

private extension LaunchView {
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "hatFall.mp3", withExtension: nil) else {
            fatalError("Unable to find \("hatFall.mp3") in bundle")
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.volume = 2.5
        audioPlayer.play()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(nameSpace: Namespace().wrappedValue)
    }
}
