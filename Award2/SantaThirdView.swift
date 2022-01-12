//
//  SantaThirdView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 29/12/2021.
//

import SwiftUI

struct SantaThirdView: View {
    @Binding var isShowed: Bool
    
    var body: some View {
        Image("santa standing on sled")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 160)
            .position(x: isShowed ? UIScreen.main.bounds.width + 300 : -100 , y: UIScreen.main.bounds.height/1.39)
    }
}

struct SantaThirdView_Previews: PreviewProvider {
    static var previews: some View {
        SantaThirdView(isShowed: .constant(false))
    }
}
