//
//  LocationMapView.swift
//  Menu
//
//  Created by Nikola Serafimov on 11/04/2026.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    let location: Location
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Map
            Map {
                Marker(location.name, coordinate: coordinate)
                    .tint(.red)
            }
            .mapStyle(.standard)
            .frame(height: 200)
            .cornerRadius(14)
            
            // Address info
            HStack(spacing: 10) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                VStack(alignment: .leading, spacing: 2) {
                    Text(location.name)
                        .font(.system(size: 14, weight: .semibold))
                    Text(location.address)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                }
                Spacer()
                // Open in Maps button
                Button(action: openInMaps) {
                    Text("Отвори")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
        }
    }
    
    func openInMaps() {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let mapItem = MKMapItem(location: location, address: nil)
        mapItem.name = self.location.name
        mapItem.openInMaps()
    }
}
