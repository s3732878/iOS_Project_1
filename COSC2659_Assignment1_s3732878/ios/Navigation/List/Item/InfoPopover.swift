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

struct InfoPopover: View {
    // Item to show the imformation
    @State var infoItem: Item
    // To show the some information(Address, Phone number, info(short description))
    @Binding var isInfo: Bool
    // To show the picture of the items with slide
    @Binding var isSlide: Bool
    // To control the Light/Dark Mode
    @Binding var isDarkMode: Bool 

    var body: some View {
        // ZStack contains evey information about item
        // Image, name, infomation button ...
        ZStack{
            //Background of the custompopover
            RoundedRectangle(cornerRadius: 25) // Creating the Rounded Rectangle
                .fill(Color(isDarkMode ? "SubColor_Dark": "SubColor")) // Making it always keep the color white
                .frame(width: 395, height: isSlide ? 800: 620)
            // Put the information element inside the RoundedRectangle
                .overlay(
                    ZStack{
                        // Border of the background
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(isDarkMode ? "Color_Dark" : "Color"), lineWidth: 2)
                        
                        VStack{
                            Spacer().frame(height: 10)
                            // Image of the Item
                            Image(infoItem.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 380, height: 220 )
                            // Set the shape of the Image
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            // Cut the image to fil the shape of image
                                .clipped()
                                .padding(.bottom, 20)
                                .shadow(color: isDarkMode ? Color.white.opacity(0.6) : Color.black.opacity(0.0), radius: 6)
                            // Name of the Item
                            Text(infoItem.name)
                                .font(.system(size: 25))
                                .bold()
                                .foregroundColor(isDarkMode ? Color.white : Color.black)
                            // Short description of restaurant
                            Text(infoItem.subInfomation)
                                .foregroundColor(Color.gray)
                            Spacer().frame(height: 20)
                            // Line under the information buttons
                            Rectangle()
                                .fill(isDarkMode ? Color.white : Color("Color"))
                                .frame(width: 360, height: 2)
                                .offset(y: 115)
                            // Presenting information button to provied additional information
                            InfoButton(buttonItem: infoItem, isInfo: $isInfo, isSlide: $isSlide, isDarkMode: $isDarkMode)
                        }// VStack

                    }//ZStack
                )//overlay
                .padding(.top, isSlide ? 120: 210)
                .edgesIgnoringSafeArea(.bottom)
        }//ZStack
    }//body
}//ItemInfo


struct InfoPopover_Previews: PreviewProvider {
    @State static var isInfo: Bool = false
    @State static var isSlide: Bool = false
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        //Iteminfo(iconName: "mappin.and.ellipse", text: items[0].address)
        InfoPopover(infoItem: items[0], isInfo: $isInfo, isSlide: $isSlide, isDarkMode: $isDarkMode)
    }
}
