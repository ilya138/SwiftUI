//
//  Group10DayForecastView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct Group10DayForecastView: View {
    
    var location: Location
    
    var body: some View {
        GroupBox(label: Label("10-DAY FORECAST", systemImage: "calendar")) {
            ForEach(location.tempByDay, id: \.self) { day in
                let date = Date.now.addingTimeInterval(Double(day.day) * 86400)
                DayRowView(date: date, tempH: day.tempH, tempL: day.tempL, tempCurrent: location.currentHourTemp.temp, condition: day.condition)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct Group10DayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        Group10DayForecastView(location: ContentView.ViewModel().locations.randomElement()!)
    }
}
