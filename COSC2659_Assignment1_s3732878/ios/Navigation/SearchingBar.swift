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

struct SearchingBar: View {
    // Bring the user input on the searching bar from NavigationListView
    @Binding var searchText: String
    // Controlling searchingResult window
    @State var isSearch: Bool = false
    // To control Light/Dark Mode
    @Binding var isDarkMode: Bool

    var body: some View {
        ZStack{
            HStack { // HStack including TextField, magnifyingglass image, x-shape icon
                //TextField to get the user input
                TextField("Searching by the name!", text: $searchText)
                    .foregroundColor(Color.black)
                    .padding(.leading, 10)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    //overlay to contain "x.circle" icon to reset the rearching bar content
                    .overlay(
                        Image(systemName: "x.circle")
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                            .padding(.leading, 270)
                        //onTapGesture (resetting searchText, closing the SearchingResult list )
                            .onTapGesture {
                                searchText = ""
                                isSearch.toggle()
                            }
                    )
                
                Spacer().frame(width: 15)
                // Deciding to compare the user input with item name
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                    .font(.system(size: 20))
                    .onTapGesture {
                        isSearch.toggle()
                    }
                    
            }// HStack
            .padding(.horizontal)
            // To control the SearchingResult List
            if isSearch && searchText != "" {
                SearchingResult(searchText: $searchText, isDarkMode: $isDarkMode)
                    .padding(.top, 240)
            }// if statement
            
            
        }// Top Level ZStack
    }// Body
}// SearingBar View

struct SearchingBar_Previews: PreviewProvider {
    @State static var searchText: String = ""
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        SearchingBar(searchText: $searchText, isDarkMode: $isDarkMode)
    }
}
