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

struct Intro: View {
    
    //Boolean for opening the information alert
    @State private var isPopoverInfo: Bool = false
    //Boolean for opening the dark mode alert
    @State private var isPopoverDarkMode: Bool = false
    //Boolean decide the light/Dark Mode
    @State var isDarkMode: Bool = false
    
    var body: some View {
        // Most top NavigationView
        NavigationView{
            //Background
            ZStack{
                //Background color depending on the light/Dark Mode
                Color(isDarkMode ? "SubColor_Dark" : "Color")
                    .edgesIgnoringSafeArea(.all)
                //Elements (Dark Mode button, Logo, Slogon, Navigation button..)
                VStack{
                    // Dark Mode Button, Information icon Button
                    HStack{
                        // DarkMode Button
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .frame(width: 60, height: 30)
                        // overlay to put the RoundedRectangle inside the RoundedRectangle
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(isDarkMode ? "SubColor_Dark" : "Color"))
                                    .frame(width: 25, height: 26)
                                    .overlay{
                                        Image(systemName: isDarkMode ? "moon.stars" : "sun.max")
                                            .bold()
                                            .foregroundColor(Color.white)
                                    }
                                    .offset(x: isDarkMode ? 15 : -15)
                            )
                        // Action when the user tap the button
                            .onTapGesture {
                                withAnimation{
                                    isDarkMode.toggle()
                                    // To show the alert
                                    isPopoverDarkMode.toggle()
                                }
                            }
                        Spacer().frame(width: 230)
                        
                        // Information icon Button
                        Button(action: {
                            isPopoverInfo.toggle()
                        })
                        {
                            // i-shape icon
                            Image(systemName: "info.square.fill")
                                .font(.system(size: 35))
                                .foregroundColor(Color(isDarkMode ? "Color_Dark" : "SubColor"))
                                .shadow(color: isDarkMode ? Color.white.opacity(0.6) : Color.black.opacity(0.0), radius: 3)
                        }
                        
                        //Alert to show the information of me
                        .alert(isPresented: $isPopoverInfo) {
                            Alert(
                                title: Text("My information!"),
                                message: Text("Name: Hanjun Lee \nStudent ID: S3732878 \nMy program: YumMap(Save great restaurants)"),
                                dismissButton: .default(Text("Back"))
                            )//Alert
                        }//alert
                        
                    }
                    
                    Spacer().frame(height: 170)
                    
                    //Application Logo (inserting image)
                    Image(isDarkMode ? "App Logo_Dark" : "App Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .cornerRadius(10)
                        .border(Color(isDarkMode ? "Color_Dark" : "SubColor"), width: 5)

                    
                    //Slogan of the application
                    Spacer().frame(height: 15)
                    Text("Explore Tasty Territories!")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)

                    Spacer().frame(height: 120)
                    
                    // Navigation button to the main menu
                    NavigationLink(destination: MainMenu(isDarkMode: $isDarkMode)){
                        Circle() // Creating the Rounded Rectangle
                            .fill(Color(isDarkMode ? "Color_Dark" : "SubColor"))
                            .frame(width: 70, height: 70)
                            .shadow(color: isDarkMode ? Color.white.opacity(0.8) : Color.black.opacity(0), radius: 5)
                            .overlay(
                                // Arrow-shape icon inside the Circle
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color(isDarkMode ? "SubColor_Dark" : "Color"))
                                )// overlay

                    }// NavigationLink
                    Spacer().frame(height: 100)
                }//VStack


                
               
            }//ZStack
        }// NavigationView
    }// Body
}// ContentView

// Showing preview of ContentView()
struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}

