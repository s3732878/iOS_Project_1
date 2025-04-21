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

struct ItemList: View {
    // listName (Breakfast, Lunch, Dinner...)
    @State var listName: String
    // Item array for using when the user choose Sorted by rate option
    let sortedByRate: [Item] = items.sorted(by: { $0.rate > $1.rate })
    // Check wheather or not user top Sorted by rate option
    @State var isSortedByRate: Bool = false
    // Item array for using when the user choose Sorted by Alphabet option
    let sortedByAlphabet: [Item] = items.sorted(by: { $0.name < $1.name })
    // Check wheather or not user top Sorted by allphabet option
    @State var isSortedByAlphabet: Bool = false
    // Item array for using when the user choose any other options
    let normalList: [Item] = items
    // To control Light/Dark Mode
    @Binding var isDarkMode: Bool

    var body: some View {
        
        ZStack{
            // if-else statement for checking witch option user choose
            if isSortedByRate{
                MakingList(listName: $listName, itemArr: sortedByRate, isDarkMode: $isDarkMode)
            }
            else if isSortedByAlphabet {
                MakingList(listName: $listName, itemArr: sortedByAlphabet, isDarkMode: $isDarkMode)
            }
            else{
                MakingList(listName: $listName, itemArr: normalList, isDarkMode: $isDarkMode)
            }
            //ZStack (Top side)
            ZStack{
                Color(isDarkMode ?  "Color_Dark" : "Color")
                .edgesIgnoringSafeArea(.top)
                .offset(y:60)
                Text(listName)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .offset(y: 90)
                    .foregroundColor(isDarkMode ? Color.white : Color.black)
            }// ZStack
            .frame(height: 200)
            .offset(y: -400)
            
            //ZStack (Bottom side)
            ZStack{
                Color(isDarkMode ? "Color_Dark" : "Color")
                    .edgesIgnoringSafeArea(.bottom)
            }//ZStack
            .frame(height: 200)
            .offset(y: 400)
            // Sortby()
            SortBy(isSortedByRate: $isSortedByRate, isSortedByAlphabet: $isSortedByAlphabet, isDarkMode: $isDarkMode)
                .padding(.bottom, 520)
                .padding(.trailing, 120)
        }// ZStack
    }// Body
}//ListBase

struct ItemList_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        ItemList(listName: "Breakfast", isDarkMode: $isDarkMode)
    }
}
