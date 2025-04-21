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

struct SortBy: View {
    //Control the DropDown List contains matched items
    @State private var isDropDown: Bool = false
    //Decide weather or not user tap Sorted By Rate
    @Binding var isSortedByRate: Bool
    //Decide weather or not user tap Sorted By Alphabet
    @Binding var isSortedByAlphabet: Bool
    // To control Light/Dark Mode
    @Binding var isDarkMode: Bool
    var body: some View {
        //ZStack contains Sorted by button and Drop down list
        ZStack{
            //Making RoundedRectangle-spape button
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(isDarkMode ? "SubColor_Dark" : "SubColor"))
                .frame(width: 230, height: 20)
                .overlay(
                    //HStack contains Text(Sorted by) and arrow-shape icon
                    HStack{
                        Text("Sorted by")
                            .foregroundColor(isDarkMode ? Color.white : Color.black)
                        Spacer().frame(width: 120)
                        // Arrow Shape icon
                        Image(systemName: isDropDown ? "arrowtriangle.up" : "arrowtriangle.down")
                            .foregroundColor(isDarkMode ? Color.white : Color.black)
                    }
                )
            //onTapgesture (if user tap show the drow down list)
                .onTapGesture {
                    withAnimation{
                        isDropDown.toggle()
                    }
                }
            // if statement isDropDown
            if isDropDown {
                // RoundedRectangle-Shape Drop Down frame
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(isDarkMode ? "Color_Dark" : "Color"))
                    .frame(width: 227, height: 80)
                //overlay to contain text and arrow-shape icon
                    .overlay(
                        //ZStack contains border of the Drop Down frame, texts
                        ZStack{
                            //Border of Drop Down frame
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(isDarkMode ? Color.white : Color("SubColor"), lineWidth: 3)
                            // VStack contains texts
                            VStack{
                                Spacer().frame(height: 10)
                                // Decide user tap Sorted By Rate
                                Text("Sorted By Rate")
                                    .foregroundColor(isDarkMode ? Color.white : Color.black)
                                    .onTapGesture {
                                        isSortedByRate.toggle()
                                        isSortedByAlphabet = false
                                    }
                                Spacer().frame(height: 8)
                                // Decide user tap Sorted By Alphabet
                                Text("Sorted By Alphabet")
                                    .foregroundColor(isDarkMode ? Color.white : Color.black)
                                    .onTapGesture {
                                        isSortedByAlphabet.toggle()
                                        isSortedByRate = false
                                    }
                                Spacer().frame(height: 8)
                            }// VStack
                        }// ZStack
                    )//overlay
                    .padding(.top, 120)
            }// if statement
        }// Top Level ZStack
    }// Body
}// SortBy View

struct SortBy_Previews: PreviewProvider {
    @State static var isSortedByRate: Bool = false
    @State static var isSortedByAlphabet: Bool = false
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        SortBy(isSortedByRate: $isSortedByRate, isSortedByAlphabet: $isSortedByAlphabet, isDarkMode: $isDarkMode)
    }
}
