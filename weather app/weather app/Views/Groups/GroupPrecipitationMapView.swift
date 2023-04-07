//
//  GroupPrecipitationMapView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI
import MapKit

struct GroupPrecipitationMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        GroupBox(label: Label("PRECIPITATION", systemImage: "umbrella").font(.caption)) {
            Map(coordinateRegion: $region)
                .frame(height: 250)
            
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupPrecipitationMapView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPrecipitationMapView()
    }
}
