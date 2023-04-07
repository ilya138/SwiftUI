//
//  GroupReportIssueView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupReportIssueView: View {
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "exclamationmark.bubble")
                    .frame(width: 50, height: 50)
                VStack {
                    Text("Report an Issue")
                        .font(.title3)
                    Text("You can describ the current conditions at your location to help improve forecasts.")
                        .font(.caption)
                }
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupReportIssueView_Previews: PreviewProvider {
    static var previews: some View {
        GroupReportIssueView()
    }
}
