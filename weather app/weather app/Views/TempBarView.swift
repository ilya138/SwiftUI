//
//  TempBarView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct TempBarView: View {
    var tempH: Int
    var tempL: Int
    var tempCurrent: Int = 10
    var body: some View {
        ZStack(alignment: .leading) {
            
            // background
            Capsule()
                .fill(.quaternary)
                .frame(height: 10.0)
            
            // temp scale
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [.green, .yellow],
                        startPoint: UnitPoint(x: 0.3, y: 0.5),
                        endPoint: UnitPoint(x: 1, y: 0.5)
                    )
                )
                .frame(height: 6)
                .frame(width: 50)
                .offset(x: 30)
            
            // current temp
            Circle()
                .strokeBorder(Color.white.opacity(0.4), lineWidth: 2.0)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .padding(2.0)
                )
                .frame(width: 6, height: 6)
                .offset(x: 50)
        }
    }
}

struct TempBarView_Previews: PreviewProvider {
    static var previews: some View {
        TempBarView(tempH: 20, tempL: 10)
    }
}
