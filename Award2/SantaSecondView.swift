//
//  SantaSecondView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 29/12/2021.
//

import SwiftUI

struct SantaSecondView: View {
    @Binding var isShowed: Bool
    
    var body: some View {
        VStack {
            Image("santa standing on sled_angle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 180)
                .scaleEffect(isShowed ? 0.3 : 1.3)
                .position(x: isShowed ? -100 : UIScreen.main.bounds.width + 300 , y: isShowed ? 0 : 200)
        }
    }
}

struct SantaSecondView_Previews: PreviewProvider {
    static var previews: some View {
        SantaSecondView(isShowed: .constant(false))
    }
}
