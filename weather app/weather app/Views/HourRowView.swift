//
//  HourRowView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct HourRowView: View {
    var hour: String
    var temp: Int
    var condition: TempCondition
    var body: some View {
        VStack {
            Text(hour)
            Image(systemName: condition.icon)
                .padding(1)
            Text("\(temp)°")
        }
    }
}

struct HourRowView_Previews: PreviewProvider {
    static var previews: some View {
        HourRowView(hour: "Now", temp: 10, condition: TempCondition.allCases.randomElement()!)
    }
}
