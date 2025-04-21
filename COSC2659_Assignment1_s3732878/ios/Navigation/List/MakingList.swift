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

struct MakingList: View {
    // To sort items by their type
    @Binding var listName: String
    // Item Array to sort
    var itemArr: [Item]
    // To control Light/Dark Mode
    @Binding var isDarkMode: Bool
    var body: some View {
        // ZStack contains List of items
        ZStack{
            // ScrollView to show every sorted item by scrolling down
            ScrollView{
                // VStack contains sorted items
                VStack{
                    // Making list by using ForEach
                    ForEach(itemArr) {
                        item in
                        // when the user choose "All" in NavigationListView, showing all items
                        if listName == "All"{
                            NavigationLink(destination: ItemView(eachItem: item, isDarkMode: $isDarkMode)){
                                ItemRow(rowItem: item, isDarkMode: $isDarkMode)
                            }
                            .frame(width: 390, height: 140)
                            Spacer().frame(height: 32)
    
                        }
                        //When the user choose other type of item, showing items depending on type
                        else{
                            if(item.type == listName){
                                NavigationLink(destination: ItemView(eachItem: item, isDarkMode: $isDarkMode)){
                                    ItemRow(rowItem: item, isDarkMode: $isDarkMode)
                                }
                                .frame(width: 390, height: 140)
                                Spacer().frame(height: 32)
                            }// if statement
                        }//else statement
                    }// ForEach
                }//VStack
                .padding(.top, 37)
            }//ScrollView
            .background(Color(isDarkMode ?  "SubColor_Dark" : "SubColor"))
        .padding(.top, 130)
        .frame(width: 390)
        }//ZStack(Middle of View)
        .offset(y: -20)
    }// Body
}// MakingList View

struct MakingList_Previews: PreviewProvider {
    @State static var listName: String = "All"
    @State static var isDarkMode: Bool = false
    static let sortedByRate: [Item] = items.sorted(by: { $0.rate > $1.rate })
    static let sortedByAlphabet: [Item] = items.sorted(by: { $0.name > $1.name })
    static var previews: some View {
        MakingList( listName: $listName, itemArr: sortedByRate,  isDarkMode: $isDarkMode)
    }
}
