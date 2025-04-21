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
import CoreLocation

struct ItemView: View {
    // To show Popover-like sindow
    @State private var isInfoPopover : Bool = false
    // To show the some information(Address, Phone number, info(short description))
    @State private var isInfo: Bool = false
    // To show the picture of the items
    @State private var isSlide: Bool = false
    // Item to show information
    var eachItem: Item
    // To control the Light/Dark Mode
    @Binding var isDarkMode: Bool
    
    var body: some View {
        // ScrollView to show the map on the background
        ScrollView{
            // ZStack contains ItemMap, HalfPopover, Infomation Buttons
            ZStack{
                // Presenting the location of the Item on the map
                ItemMap(ItemCoordinate: eachItem)
                    .frame(height: 900)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: isInfoPopover ? 0 : -280)
                // If user tap the empty space Popover-like window, it will be colsed
                if !isInfoPopover {
                    InfoPopover(infoItem: eachItem, isInfo: $isInfo, isSlide: $isSlide, isDarkMode: $isDarkMode)
                        .onTapGesture {
                            withAnimation{
                                isInfoPopover.toggle()
                            }
                        }
                    
                }// if statement
                // When the users whatching the map only, provied them a button to show more detail information of the Item
                if isInfoPopover{
                    Button("Open Detail"){
                        withAnimation{
                            isInfoPopover.toggle()
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 30)
                    .background(Color(isDarkMode ? "Color_Dark" : "Color"))
                    .cornerRadius(10)
                    .font(.system(size: 25))
                    .bold()
                    .offset(y: 350)
                    
                }// if statement
            }// Top level ZStack
        }// ScrollView
        .edgesIgnoringSafeArea(.all)
    }// Body
}//ItemView




struct ItemView_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = false

    static var previews: some View {
        ItemView(eachItem: items[0], isDarkMode: $isDarkMode)
    }
}

