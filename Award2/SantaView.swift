//
//  SantaView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 29/12/2021.
//

import SwiftUI
import AVFoundation

struct SantaView: View {
    @Binding var isShowed: Bool
    
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        Image("santa _sleds_with_deers")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 450)
            .rotationEffect(Angle(degrees: -25))
            .scaleEffect(isShowed ? 1.2 : 0.1)
            .position(x: isShowed ? UIScreen.main.bounds.width + 300 : -100, y: isShowed ? 0 : 200)
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (timer) in
                    playSound()
                }
            })
            .onDisappear {
                audioPlayer.stop()
            }
    }
}

private extension SantaView {
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "Merry-Chirstmas.mp3", withExtension: nil) else {
            fatalError("Unable to find \("Merry-Chirstmas.mp3") in bundle")
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

struct SantaView_Previews: PreviewProvider {
    static var previews: some View {
        SantaView(isShowed: .constant(true))
    }
}
