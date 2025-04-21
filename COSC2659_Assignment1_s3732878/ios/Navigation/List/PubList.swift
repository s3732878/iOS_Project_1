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
import MapKit

struct PubList: View {
    @Binding var isDarkMode: Bool
    var body: some View {
        //Making list with items that has Pub type
        ItemList(listName: "Pub", isDarkMode: $isDarkMode)
    }
}
struct PubList_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        PubList(isDarkMode: $isDarkMode)
    }
}
