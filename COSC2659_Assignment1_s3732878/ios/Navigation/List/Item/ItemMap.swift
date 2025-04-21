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
import SwiftUI
// To using Map-related tool
import MapKit

struct ItemMap: View {
    // To get the location of the Item
    let ItemCoordinate: Item
    // Set ItemRegion as MKCoordinateRegion to store the center of map and Zoom Ratio
    @State private var ItemRegion = MKCoordinateRegion()
    
    var body: some View {
        //Show the Map
        // Set the area to present ItemRegion
        // Store the MapMaker data by using annotationItems
        // Creating Map Marker based on the data of annotationItems by using ItemCoordinate
        Map(coordinateRegion: $ItemRegion, annotationItems: [ItemCoordinate])
        {
            ItemCoordinate in MapMarker(coordinate: ItemCoordinate.locationCoordinate, tint: Color.red)
            
        }
            // Set the initial state of the map
            .onAppear{
                ItemRegion = MKCoordinateRegion(center: ItemCoordinate.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
            }

    }
}

struct ItemMap_Previews: PreviewProvider {
    static var previews: some View {
        ItemMap(ItemCoordinate: items[0])
    }
}
