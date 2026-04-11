//
//  RestaurantInfo.swift
//  Menu
//
//  Created by Nikola Serafimov on 11/04/2026.
//

import Foundation

struct WorkingHoursEntry {
    let day: String
    let hours: String
}

struct RestaurantInfo {
    let name: String
    let tagline: String
    let imageName: String
    let about: String
    let hours: String
    let phone: String
    let rating: String
    let priceRange: String
    let location: Location
    let workingHours: [WorkingHoursEntry]
    
    static let main = RestaurantInfo(
        name: "Ресторан Македонија",
        tagline: "Автентична македонска кујна од 1995",
        imageName: "restaurant",
        about: "Ресторан Македонија е место каде традицијата се среќава со модерниот вкус. Нашите јадења се подготвени со свежи локални состојки, инспирирани од богатото македонско кулинарско наследство. Секој оброк е искуство кое ќе го паметите.",
        hours: "08:00 - 23:00",
        phone: "+389 2 123 456",
        rating: "4.8 ★",
        priceRange: "€€",
        location: Location(
            name: "Ресторан Македонија",
            address: "Плоштад Македонија, Скопје",
            latitude: 41.9965,
            longitude: 21.4314
        ),
        workingHours: [
            WorkingHoursEntry(day: "Понеделник - Четврток", hours: "08:00 - 23:00"),
            WorkingHoursEntry(day: "Петок и Сабота", hours: "08:00 - 00:00"),
            WorkingHoursEntry(day: "Недела", hours: "09:00 - 22:00"),
        ]
    )
}
