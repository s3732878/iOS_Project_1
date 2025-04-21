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

struct InfoButton: View {
    // To get the information detail depending on user want to see
    @State private var infoText: String = ""
    // To get the type of information  depending on user
    @State private var infoTitle: String = ""
    // Array of button name and their boolean
    @State private var isInfoItem: [Info] =
    [
        Info(icon: "mappin.and.ellipse", iconName:
            "Address"),
        Info(icon: "phone.circle.fill", iconName:
            "Phone"),
        Info(icon: "info.circle.fill", iconName:
            "Info"),
        Info(icon: "photo", iconName:
            "Picture")
    ]

    // Item to get the information
    @State var buttonItem: Item
    // To show the some information(Address, Phone number, info(short description))
    @Binding var isInfo: Bool
    // To show the picture of the items with slide
    @Binding var isSlide: Bool
    // To control the Light/Dark Mode
    @Binding var isDarkMode: Bool
    
    
    var body: some View {
    HStack(){

        Spacer().frame(width: 18)
        // Creating buttons to show the information
        ForEach(0...3, id: \.self){
            index in
            VStack{
                Circle() // Creating the Rounded Rectangle
                    .fill(Color(isDarkMode ? "Color_Dark" : "Color")) // Making it always keep the color white
                    .frame(height: 70)
                    .shadow(color: isDarkMode ? Color.white.opacity(0.3) : Color.black.opacity(0.0), radius: 5)
                    .overlay(
                        ZStack{
                            Image(systemName: isInfoItem[index].icon)
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)

                        }//ZStack
                    )//overlay
                    .onTapGesture {
                        withAnimation{
                            //if-else statement to check whitch button that user tap
                            if index == 0{
                                infoTitle = isInfoItem[index].iconName
                                infoText = buttonItem.address
                                isSlide = false
                                if !isInfo{
                                    isInfo.toggle()
                                }
                                
                            }
                            else if index == 1{
                                infoTitle = isInfoItem[index].iconName
                                infoText = buttonItem.phone
                                isSlide = false
                                if !isInfo{
                                    isInfo.toggle()
                                }
                            }
                            else if index == 2{
                                infoTitle = isInfoItem[index].iconName
                                infoText = buttonItem.information
                                isSlide = true
                                if !isInfo{
                                    isInfo.toggle()
                                }
                            }
                            else{
                                isSlide = true
                                isInfo = false
                            }
                        }//withAnimation
                    }//onTapGesture
                // Show the name of inforamtion depending on user
                Text(isInfoItem[index].iconName)
                    .foregroundColor(isDarkMode ? Color.white : Color("Color"))
                    .fontWeight(.bold)
                }//VStack inside of ForEach
        }//ForEach
        .padding(.trailing, 15)
    }//HStack

    // if user tap address, phone, info button, show that information
    if isInfo == true{
        Spacer().frame(height: 20)
        VStack(alignment: .leading){
            Text(infoTitle) // Information title
                .frame(width: 350, height: 20, alignment: .leading)
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .foregroundColor(isDarkMode ? Color.white : Color.black)
            
            Text(infoText) // Information(Address, Phone, Information Food, Drink)
                .edgesIgnoringSafeArea(.bottom)
                .frame(width: 350, height: isSlide ? 200 : 45, alignment: .top)
                .frame(alignment: .leading)
                .foregroundColor(isDarkMode ? Color.white : Color.black)


        }
    }// if statement
    // when user tap Picture button, show the slide of picture
    else if isInfo == false && isSlide == true{
        Spacer().frame(height: 30)
        ImageSlide(slideItem: buttonItem, isDarkMode: $isDarkMode)
    }

        Spacer().frame(width: 20)
    }
}

struct InfoButton_Previews: PreviewProvider {
    @State static var isInfo: Bool = false
    @State static var isSlide: Bool = false
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        InfoButton(buttonItem: items[0], isInfo: $isInfo, isSlide: $isSlide, isDarkMode: $isDarkMode)
    }
}
