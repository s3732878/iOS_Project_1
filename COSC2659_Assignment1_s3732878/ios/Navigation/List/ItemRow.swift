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

struct ItemRow: View {
    //Making instance of Contact
    let rowItem: Item
    //To control the Light/Dark Mode
    
    @Binding var isDarkMode: Bool
    var body: some View {
        //ZStack contains item image, name, subname and rate with star image
        ZStack(alignment: .leading){
            Color(isDarkMode ?  "Color_Dark" : "Color")
            //HStack contains item name and subname
            HStack(){
                Spacer().frame(width: 15)
                // item image
                rowItem.image
                    .resizable()
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                Spacer().frame(width: 20)
                VStack(alignment: .center){
                    // item name
                    Text(rowItem.name)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(isDarkMode ? Color.white : Color.black)
                    Spacer().frame(height: 10)
                    // item subname
                    Text(rowItem.subInfomation)
                        .foregroundColor(Color.gray)
                        .offset(y: -5)
                }//VStack
            }//HStack
            // VStack contains rate with star-shape icon
            VStack{
                // star-shape icon
                Image(systemName: "star.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("SubColor"))
                // item rate
                Text(String(rowItem.rate))
                    .font(.system(size: 15))
                    .foregroundColor(isDarkMode ? Color.white : Color.black)
            }//VStack
            .offset(y: 40)
            .offset(x: 315)
        }//Top Level ZStack
        .frame(width: 350, height: 130)
        .cornerRadius(10)
        .shadow(color: isDarkMode ? Color.white.opacity(0.3) : Color.black.opacity(0.3), radius: 10)
    }// Body
}// ItemRow View

struct ItemRow_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        ItemRow(rowItem: items[0], isDarkMode: $isDarkMode)
        ItemRow(rowItem: items[0], isDarkMode: $isDarkMode)
        ItemRow(rowItem: items[0], isDarkMode: $isDarkMode)
    }
}


