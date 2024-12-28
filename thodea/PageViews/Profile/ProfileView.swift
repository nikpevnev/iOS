import SwiftUI

struct ProfileView: View {
    @State private var userName: String = "John Doe" // Sample username
    @State private var userImage: String = "profile_picture"
    @State private var selectedTab: String = "thoughts"
    @State private var bioInfo: Bool = true
    @State private var profileInfo: [String: Any] = ["thoughts": 0, "followers": 1, "following": 1]
  
    
    var body: some View {
        
        
        VStack(spacing: 4) {
            // Uploading overlay
            
            HStack() {
                
                VStack {
                    NavigationLink(destination: SettingsView()) {
                        SettingsSVG()
                            .font(.headline)
                            .frame(maxWidth: 50, maxHeight: .infinity, alignment: .leading)
                    }
                }
                
                    //.border(.green, width: 2)
                Text("username")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                ZStack(alignment: .topTrailing) {
                       // Envelope Image
                    
                    NavigationLink(destination: ChatsView()) {
                            Image(systemName: "envelope")
                                .foregroundColor(Color(red: 156 / 255, green: 163 / 255, blue: 175 / 255))
                                .font(.title2)
                                .frame(maxWidth: 50, maxHeight: .infinity, alignment: .trailing)
                        }
                  
                       
                       // Orange Circle at top-right corner
                       /*Circle()
                           .fill(Color(red: 161 / 255, green: 98 / 255, blue: 7 / 255))
                           .frame(width: 10, height: 10)
                           .offset(x: 2, y: -2) */
                   }
                   .frame(width: 50, height: 24)// Adjust position if needed
            }
            .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
            //.border(.gray, width: 4)
            .padding(.bottom, 4)
            
            
            HStack(spacing: 4) {
                    ZStack {
                        // Rounded rectangle with border and shadow
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.clear)
                            .frame(width: 100, height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1) // Border
                            )
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)

                        // Smaller image inside the rounded rectangle
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .padding(10) // Add padding to make it smaller
                            .foregroundColor(.gray)
                    }
                    .frame(width: 100, height: 100)

            
                VStack() {
                        HStack {
                            let followers = profileInfo["followers"] as! Int
                            Text("\(formatNumber(followers)) \(followers == 1 ? "follower" : "followers")")
                                .font(.system(size: 17)).fixedSize()
                           
                           Spacer() // Push the next elements to the right

                            HStack(spacing: 0) {
                               // Blue line with width of 3
                               Rectangle()
                                   .fill(Color(red: 2 / 255, green: 132 / 255, blue: 199 / 255)) // Line color
                                   .frame(height: 3) // Line thickness
                                   .padding(0)
                               
                               // Small blue dot at the end of the line
                               Rectangle()
                                   .fill(Color(red: 7 / 255, green: 89 / 255, blue: 133 / 255))
                                   .frame(width: 8, height: 8, alignment: .trailing) // Size of the dot
                                   .padding(0)

                           }
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    
                        
                        HStack {
                            Text("\(formatNumber(profileInfo["following"] as! Int)) following")
                               .font(.system(size: 17)).fixedSize()
                           
                           Spacer() // Push the next elements to the right

                            HStack(spacing: 0) {
                               // Blue line with width of 3
                               Rectangle()
                                   .fill(Color(red: 2 / 255, green: 132 / 255, blue: 199 / 255)) // Line color
                                   .frame(height: 3) // Line thickness
                                   .padding(0)
                               
                               // Small blue dot at the end of the line
                               Rectangle()
                                   .fill(Color(red: 7 / 255, green: 89 / 255, blue: 133 / 255)) // Dot color
                                   .frame(width: 8, height: 8, alignment: .trailing) // Size of the dot
                                   .padding(0)

                           }
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .padding(.leading, 12)
                }
                .frame(maxWidth: .infinity, maxHeight: 100) // Set height for row
                .padding(.top, 4)
                .padding(.bottom, 4)
            
            VStack {
                     HStack {
                         TabButton(title: "thoughts", selectedTab: $selectedTab, bioInfo: bioInfo, count: profileInfo["thoughts"] as? Int ?? 0)
                         TabButton(title: "loved", selectedTab: $selectedTab, bioInfo: bioInfo, count: profileInfo["loved"] as? Int ?? 0)
                         TabButton(title: "mentions", selectedTab: $selectedTab, bioInfo: bioInfo, count: profileInfo["mentioned"] as? Int ?? 0)
                     }
                     .padding(.top, bioInfo ? 2 : 4)  // Adjust the margin based on `bioInfo`
                     .frame(maxHeight: 50)
                 }

            //.border(Color.green, width: 2)
            
        }.padding()
    }
}


struct SettingsSVG: View {
    var body: some View {
        ZStack {
            // Outer Circle
            
            Circle()
                .fill(Color(red: 156 / 255, green: 163 / 255, blue: 175 / 255)) // Transparent outer circle
                .frame(width: 26, height: 26)
        

            // Middle Circle
            Circle()
                .fill(Color(red: 17/255, green: 24/255, blue: 39/255)) // Red middle circle
                .frame(width: 22, height: 22)
            
            Circle()
                .fill(Color(red: 156 / 255, green: 163 / 255, blue: 175 / 255)) // Transparent outer circle
                .frame(width: 10, height: 10)
                .offset(y: -4)
            
            // Inner Circle
            Circle()
                .fill(Color(red: 17/255, green: 24/255, blue: 39/255)) // Gray inner circle
                .frame(width: 6, height: 6)
                .offset(y: -4)
            
            Circle()
                .fill(Color(red: 156 / 255, green: 163 / 255, blue: 175 / 255)) // Transparent outer circle
                .frame(width: 22, height: 22)
                .offset(y: 13)
                .mask(
                    Circle()
                        .frame(width: 22, height: 22) // Defines the cropping area
                )
            
            Circle()
                .fill(Color(red: 17/255, green: 24/255, blue: 39/255)) // Gray inner circle
                .frame(width: 20, height: 20)
                .offset(y: 14)
                .mask(
                    Circle()
                        .frame(width: 22, height: 22) // Defines the cropping area
                )
     
        }
        .frame(width: 24, height: 24)
    }
}

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var bioInfo: Bool
    var count: Int
    
    var body: some View {
        VStack {
            Button(action: {
                selectTab(title: title)
            }) {
                VStack(spacing: 4) {
                    HStack {
                        Text(title)
                            .fontWeight(selectedTab == title ? .medium : .regular).fixedSize()
                        if count > 0 {
                            Text("\(formatNumber(count))").fixedSize()
                        } else if title == "thoughts" {
                            Text("0")
                        }
                    }
                    .padding(.horizontal, 4)
                    .padding(.bottom, selectedTab == title ? 0 : 5)
                    .background(selectedTab == title ? Color.clear : Color.clear)
                    .cornerRadius(5)
                    .foregroundColor(.white.opacity(0.9))
                    if selectedTab == title {
                        BottomBorder()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    private func selectTab(title: String) {
        selectedTab = title
    }
}

struct BottomBorder: View {
    let color: Color = Color(red: 7/255, green: 89/255, blue: 133/255)
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
