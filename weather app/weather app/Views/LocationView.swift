//
//  LocationView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct LocationView: View {
    
    var location: Location
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section {
                    Text(location.name)
                        .font(.title3)
                    Text("\(location.currentHourTemp.temp)°")
                        .font(.largeTitle)
                    Text(location.currentHourTemp.condition.rawValue)
                    Text("H:\(location.currentDayTemp.tempH)° L:\(location.currentDayTemp.tempL)°")
                } header: {
                    
                }

            }
            
            GroupHourlyForecastView(location: location)
            Group10DayForecastView(location: location)
            GroupPrecipitationMapView()
            
            HStack {
                GroupUVIndexView()
                GroupSunsetView()
            }.frame(minHeight: 150)
            
            HStack {
                GroupWindView()
                GroupPrecipitationView()
            }.frame(minHeight: 150)
            
            HStack {
                GroupFeelsLikeView()
                GroupHumidityView()
            }.frame(minHeight: 150)
            
            HStack {
                GroupVisibilityView()
                GroupPressureView()
            }.frame(minHeight: 150)
            
            GroupReportIssueView()
            
        }
        .padding()
        .background(LinearGradient(colors: location.currentHourTemp.condition.background, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: ContentView.ViewModel().locations[0])
    }
}
