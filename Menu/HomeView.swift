//
//  HomeView.swift
//  Menu
//
//  Created by Nikola Serafimov on 11/04/2026.
//

import SwiftUI
import MapKit

struct HomeView: View {
    let restaurant = RestaurantInfo.main
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Hero image
                GeometryReader { geo in
                    ZStack(alignment: .bottom) {
                        Image(restaurant.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width)
                            .frame(height: 280)
                            .clipped()

                        LinearGradient(
                            colors: [.clear, .black.opacity(0.7)],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(height: 280)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(restaurant.name)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            Text(restaurant.tagline)
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.85))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                    }
                }
                .frame(height: 280)

                VStack(alignment: .leading, spacing: 20) {

                    // Info pills
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            InfoPill(icon: "clock.fill",           text: restaurant.hours,      color: .blue)
                            InfoPill(icon: "phone.fill",           text: restaurant.phone,      color: .green)
                            InfoPill(icon: "star.fill",            text: restaurant.rating,     color: .orange)
                            InfoPill(icon: "eurosign.circle.fill", text: restaurant.priceRange, color: .purple)
                        }
                        .padding(.horizontal, 20)
                    }

                    Divider()
                        .padding(.horizontal, 20)

                    // About
                    VStack(alignment: .leading, spacing: 8) {
                        Text("За нас")
                            .font(.system(size: 18, weight: .semibold))
                        Text(restaurant.about)
                            .font(.system(size: 15))
                            .foregroundColor(.primary)
                            .lineSpacing(5)
                    }
                    .padding(.horizontal, 20)

                    Divider()
                        .padding(.horizontal, 20)

                    // Location
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Локација")
                            .font(.system(size: 18, weight: .semibold))
                        LocationMapView(location: restaurant.location)
                    }
                    .padding(.horizontal, 20)

                    Divider()
                        .padding(.horizontal, 20)

                    // Working hours
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Работно време")
                            .font(.system(size: 18, weight: .semibold))
                        VStack(spacing: 8) {
                            ForEach(restaurant.workingHours, id: \.day) { entry in
                                HStack {
                                    Text(entry.day)
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Text(entry.hours)
                                        .font(.system(size: 14, weight: .medium))
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)

                    Spacer(minLength: 20)
                }
                .padding(.top, 20)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}


struct InfoPill: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 13))
                .foregroundColor(color)
            Text(text)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(color.opacity(0.1))
        .cornerRadius(20)
    }
}
