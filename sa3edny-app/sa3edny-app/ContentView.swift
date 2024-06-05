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
    
    var body: some View {
        NavigationStack {
            ForEach(platforms, id: \.name) {platform in
                VStack{
                    NavigationLink(value: platform) {
                        Label(platform.name, systemImage: platform.imageName)
                            .foregroundColor(platform.color)
                    }
                }.padding()
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
