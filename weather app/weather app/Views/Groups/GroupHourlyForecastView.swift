//
//  GroupHourlyForecastView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupHourlyForecastView: View {
    
    var location: Location
    
    var body: some View {
        GroupBox(label:
                    Text("Cloudy conditions will continue for the rest of the day. Wind gusts are up to 4 m/s")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(location.tempByHour, id: \.self) { hour in
                        HourRowView(hour: String(hour.hour), temp: hour.temp, condition: hour.condition)
                            .frame(alignment: .center)
                            .padding(.trailing)
                    }
                }
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupHourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        GroupHourlyForecastView(location: ContentView.ViewModel().locations.randomElement()!)
    }
}
