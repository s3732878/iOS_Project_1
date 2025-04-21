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

struct SearchingResult: View {
    // Store the user input
    @Binding var searchText: String
    // To control the Light/Dark Mode
    @Binding var isDarkMode: Bool
    
    var body: some View {
        //List to show the searching result
        List(items){
            item in
            // if user input is matched to item name, show the ItemView link
            if item.name.contains(searchText) {
                //NavigationLink to matched items
                NavigationLink{
                    ItemView(eachItem: item, isDarkMode: $isDarkMode)
                } label: {
                    Text("\(item.name)")
                }
            }// if statement
        }// List
        .frame(width: 300, height: 200)
        .cornerRadius(10)
        .padding(.trailing, 50)
    }// Body
}// SearchingResult View

struct SearchingResult_Previews: PreviewProvider {
    @State static var searchText: String = "Ga"
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        SearchingResult(searchText: $searchText, isDarkMode: $isDarkMode)
    }
}
