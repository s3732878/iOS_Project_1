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

struct MenuButton: View {
    // Name of the icon and icon image
    @State var buttonName: String
    // To control Light/Dark Mode
    @Binding var isDarkMode: Bool
    
    var body: some View {
        // RoundedRectangle shape
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(isDarkMode ?  "Color_Dark" : "Color"))
            .frame(width: 150, height: 150)
            .shadow(color: isDarkMode ? Color.white.opacity(0.3) : Color.black.opacity(0.5), radius: 5)
        //content inside the RoundedRectangle(icon & icon name)
            .overlay(
                ZStack{
                    VStack{
                        // Inserting icon
                        Image(buttonName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .foregroundColor(Color.white)
                        Spacer().frame(height: 7)
                        // Inserting icon name
                        Text(buttonName)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    .padding(.top, 5)
                }
            )
    }
}

struct MenuButton_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = false
    static var previews: some View {
        MenuButton(buttonName: "Lunch", isDarkMode: $isDarkMode)
    }
}
