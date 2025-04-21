/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Hanjun Lee
  ID: 3732878
  Created  date: 07/25/2023
  Last modified: 06/08/2023
  Acknowledgement: Every sources come from Google Maps and All of the reference are in the report
*/
import Foundation
import SwiftUI
import CoreLocation // For presenting a map inside the application


// Declaring struct Item to store the information about the restaurant
struct Item: Identifiable, Codable{
    var id: UUID {
        UUID()
    }
    let name: String // name of restaurant
    let address: String // address of restaurant
    let type: String // type of address of restaurant(Breakfast, Lunch, Dinner, Coffee, Pub)
    let phone: String // Phone number of the restaurant
    let rate: Double // rating of the restaurant
    let imageName: String // the name of main image of the restaurant
    let information: String // Short description for the restaurant
    let subInfomation: String // additional type of restaurant (depending on restaurant)
    let imageArray: [String]
    let coordinates: Coordinates
    // Method
    var image: Image{ // method to inserting restaurant image
        Image(imageName)
    }

    var locationCoordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

struct Coordinates: Codable{
    var latitude: Double
    var longitude: Double
}


// struct for Creating info buttons in the ItemView
struct Info : Identifiable{
   var id = UUID()
   var icon: String
   var iconName: String
}
