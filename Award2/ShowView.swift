//
//  ShowView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 29/12/2021.
//

import Foundation
import SwiftUI

struct SnowView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let screenSize = UIScreen.main.bounds
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        view.layer.masksToBounds = true
        
        let emitter =  CAEmitterLayer()
        emitter.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        emitter.emitterShape = .circle
        emitter.emitterPosition = CGPoint(x: screenSize.width/2, y: -200)
        emitter.emitterMode = .surface
        emitter.renderMode = .oldestLast
        
        let cell = CAEmitterCell()
        cell.birthRate = 30
        cell.lifetime = 20
        cell.velocity = 100
        cell.scale = 0.03
        cell.emissionRange = CGFloat.pi
        
        cell.contents = UIImage(named: "snowflakes")?.cgImage
        
        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
