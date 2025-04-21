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

struct MainMenu: View {
    // To store the user input in SearchingBar
    @State var searchText: String = ""
    // To control the Light/Dark Mode
    @Binding var isDarkMode: Bool
    
    var body: some View{
        ZStack{

            ZStack{
                // Background of the area that Navigation Buttons are located
                Color(isDarkMode ?  "SubColor_Dark" : "SubColor")
                    .edgesIgnoringSafeArea(.all)
                
                // For ranging the Navigation Buttons(Breakfast, Lunch, Dinner...)
                VStack{
                    // For ranging two Navigatikon Buttons in horizon
                    HStack{
                        // Button to move to the Breakfast Item list
                        NavigationLink(destination: BreakfastList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "Breakfast", isDarkMode: $isDarkMode)
                        }// NavigationLink to Breakfast list
                        Spacer().frame(width: 40)
                        // Button to move to the Lunch Item list
                        NavigationLink(destination: LunchList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "Lunch", isDarkMode: $isDarkMode)
                        }// NavigationLink to Lunch list
                    }// HStack
                    Spacer().frame(height: 40)
                    HStack{
                        // Button to move to the Dinner Item list
                        NavigationLink(destination: DinnerList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "Dinner", isDarkMode: $isDarkMode)
                        }// NavigationLink to Dinner list
                        Spacer().frame(width: 40)
                        // Button to move to the Coffee Item list
                        NavigationLink(destination: CoffeeList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "Coffee", isDarkMode: $isDarkMode)
                        }// NavigationLink to Coffee list
                    }// HStack
                    Spacer().frame(height: 40)
                    HStack{
                        // Button to move to the Pub Item list
                        NavigationLink(destination: PubList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "Pub", isDarkMode: $isDarkMode)
                        }// NavigationLink to Pub list
                        Spacer().frame(width: 40)
                        // Button to move to the All Item list
                        NavigationLink(destination: AllItemList(isDarkMode: $isDarkMode)){
                            MenuButton(buttonName: "All", isDarkMode: $isDarkMode)
                        }// NavigationLink to All list
                    }// HStack
                }// VStack (Including Navigation Buttons)
            }// ZStack (Including the background)
            // Top side area (Orange Color)
            ZStack{
                Color(isDarkMode ?  "Color_Dark" : "Color")
                    .edgesIgnoringSafeArea(.top)
                
                //Searching Bar let user to find items by the name of items
                SearchingBar(searchText: $searchText, isDarkMode: $isDarkMode)
                    .offset(y: 60)
            }//ZStack Bo
            .frame(height: 200)
            .offset(y: -400)
            
            // Buttom side area including SearchingBar
            ZStack{
                Color(isDarkMode ?  "Color_Dark" : "Color")
                    .edgesIgnoringSafeArea(.bottom)
            }//ZStack
            .frame(height: 200)
            .offset(y: 400)

        }// Top Level ZStack
    }//body
}//NavigationListView






 // To show Preview (Just for checking)
struct MainMenu_Previews: PreviewProvider{
    @State static var isDarkMode: Bool = false
    static var previews: some View{
        MainMenu(isDarkMode: $isDarkMode)
    }
}



