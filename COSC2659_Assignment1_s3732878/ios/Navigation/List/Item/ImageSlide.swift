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

struct ImageSlide: View {
    //Item to get images
    @State var slideItem: Item
    //To control Light/Dark Mode
    @Binding var isDarkMode: Bool
    //To count the index of the imageArray
    @State private var imageIndex: Int = 0
    
    var body: some View {
        
        // HStack to arrange the element (button , image) in horizontal
        HStack{
            Spacer().frame(width: 5)
            // Button to slide the picture to the left side
            Circle() // Creating the Circle shape button
                .fill(Color(isDarkMode ? "Color_Dark" : "Color"))
                .frame(width: 30, height: 30)
                .shadow(color: isDarkMode ? Color.white.opacity(0.5) : Color.black.opacity(0.0), radius: 5)
                .overlay(
                    ZStack{
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.white)
                    }//ZStack
                    )//overlay
            // When user tap the button, show the next picture
                .onTapGesture {
                    // if statement to make a cycle of the image
                    if imageIndex > 0 {
                        imageIndex -= 1
                    }
                    else{
                        imageIndex = slideItem.imageArray.count - 1
                    }
                }// ontapGesture
            // Inserting image between the buttons
            Image(slideItem.imageArray[imageIndex])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200 )
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            //Button to slide picture to right side
            Circle() // Creating the Circle shape button
                .fill(Color(isDarkMode ? "Color_Dark" : "Color"))
                .frame(width: 30, height: 30)
                .shadow(color: isDarkMode ? Color.white.opacity(0.5) : Color.black.opacity(0.0), radius: 5)
                .overlay(
                    ZStack{
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color.white)
                    }//ZStack
                    )// overlay
                .onTapGesture {
                    // if statement to make a cycle of the image
                    if imageIndex < slideItem.imageArray.count - 1 {
                        imageIndex += 1
                    }
                    else{
                        imageIndex = 0
                    }
                }
            
            Spacer().frame(width: 5)
        }
    }
}

struct ImageSlide_Previews: PreviewProvider {
    @State static var isDarkMode: Bool = true
    static var previews: some View {
        ImageSlide(slideItem: items[5] ,isDarkMode: $isDarkMode)
    }
}
