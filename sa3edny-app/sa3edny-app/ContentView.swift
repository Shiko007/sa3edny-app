//
//  ContentView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    var platforms: [Platform] = [.init(name: "Carpenter", imageName: "chair.fill", color: .brown),
                                 .init(name: "Electrician", imageName: "bolt.slash.fill", color: .yellow),
                                 .init(name: "Plumber", imageName: "sink.fill", color: .cyan),
                                 .init(name: "Maintainance", imageName: "tv.fill", color: .indigo),
                                 .init(name: "Pet Grooming", imageName: "cat.fill", color: .gray),
                                 .init(name: "Cleaner", imageName: "washer.fill", color: .teal),
                                 .init(name: "Gardner", imageName: "tree.fill", color: .green)]
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        let spacing = screenWidth * 0.10
        let columns = [
            GridItem(.flexible(), spacing: spacing),
            GridItem(.flexible(), spacing: spacing)]
        let buttonWidth = (screenWidth - 2 * spacing) / 2
        let buttonHeight = screenHeight * 0.1
        NavigationStack {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(platforms, id: \.name) {platform in
                    NavigationLink(value: platform) {
                        Label(platform.name, systemImage: platform.imageName)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .foregroundColor(platform.color)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Services")
                .navigationDestination(for: Platform.self){ platform in
                    ZStack{
                        platform.color.ignoresSafeArea()
                        VStack{
                            Label(platform.name, systemImage: platform.imageName).font(.largeTitle).bold()
                        }.padding()
                    }
                }
        }
    }
}
struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
    
#Preview {
    ContentView()
}
