//
//  Model.swift
//  weather app
//
//  Created by Admin on 03.04.2023.
//

import Foundation
import SwiftUI

enum TempCondition: String, CaseIterable {
    case clear = "Clear"
    case rain = "Raining"
    case cloud = "Cloudy"
    case wind = "Windy"
    case snow = "Snow"
    
    var icon: String {
        switch self {
        case .clear: return "sun.max.fill"
        case .rain:  return "cloud.rain.fill"
        case .cloud: return "cloud.fill"
        case .wind:  return "wind"
        case .snow:  return "snow"
        }
    }
    
    var background: [Color] {
        switch self {
        case .clear: return [.blue, .mint]
        case .rain:  return [.blue, .gray.opacity(0.5)]
        case .snow:  return [.blue.opacity(0.1), .gray.opacity(0.5)]
        case .cloud: return [.gray.opacity(0.5), .gray]
        case .wind:  return [.gray, .gray.opacity(0.5)]
        default: return [.white]
        }
    }
}

struct HourTemp: Hashable {
    var hour: Int
    var temp: Int
    var condition: TempCondition
}

struct DayTemp: Hashable {
    var day: Int
    var tempH: Int
    var tempL: Int
    var condition: TempCondition
}

struct Location: Identifiable {
    
    var id: UUID = UUID()
    
    var name: String
    var tempByHour: [HourTemp] = []
    var tempByDay: [DayTemp] = []
    
    var currentHourTemp: HourTemp { tempByHour[0] }
    var currentDayTemp: DayTemp { tempByDay[0] }
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var locations: [Location]
        
        init() {
            
            locations = []
            
            let cities = ["Kemer", "Moscow", "San-Francisco", "Los-Angeles", "New-York"]
            for city in cities {
                var newCity = Location(name: city)
                
                // adding temp for all hours
                for hour in 0...23 {
                    newCity.tempByHour.append(HourTemp(hour: hour, temp: Int.random(in: 0...35), condition: TempCondition.allCases.randomElement()!))
                }
                
                // adding temp for the next 10 days
                for day in 0...9 {
                    var dayTemp = DayTemp(day: day, tempH: Int.random(in: 10...35), tempL: Int.random(in: 0...10), condition: TempCondition.allCases.randomElement()!)
                    newCity.tempByDay.append(dayTemp)
                }
                
                locations.append(newCity)
            }
        }
    }
}
