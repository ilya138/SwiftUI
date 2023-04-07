//
//  DayRowView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct DayRowView: View {
    var date: Date
    var tempH: Int
    var tempL: Int
    var tempCurrent: Int = 10
    var condition: TempCondition
    var body: some View {
        HStack {
            Group {
                if Calendar.current.isDateInToday(date) {
                    Text("Today")
                        .font(.title2)
                } else {
                    Text(date, format: .dateTime.weekday())
                        .font(.title2)
                }
            }
            .frame(width: 60)
                
            Image(systemName: condition.icon)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Spacer()
            Text("\(tempL)°")
                .font(.title2)
            TempBarView(tempH: tempH, tempL: tempL)
                .frame(width: 100)
            Text("\(tempH)°")
                .font(.title2)
                .frame(width: 40)
                .frame(alignment: .trailing)
        }
    }
}

struct MultiRowPreview: View {
    var body: some View {
        GroupBox(label: Label("10-DAY FORECAST", systemImage: "calendar")) {
            ForEach(0..<5) { _ in
                DayRowView(date: Date(timeInterval: Double.random(in: 0...100000), since: Date()), tempH: Int.random(in: 0...30), tempL: Int.random(in: 0...30), condition: TempCondition.allCases.randomElement()!)
            }
        }
    }
}

struct DayRowView_Previews: PreviewProvider {
    static var previews: some View {
        MultiRowPreview()
    }
}
