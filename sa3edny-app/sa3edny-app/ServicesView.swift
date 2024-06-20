//
//  ServicesView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 14.06.24.
//

import SwiftUI

struct ServicesView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    @State private var displayUserView = false
    
    var body: some View {
        let spacing = screenWidth * ServiceButtons().spacingFactor
        let userID = authViewModel.user?.email ?? "unknown"
        
        NavigationStack {
            ScrollView{
                ForEach(ServiceButtons().services, id: \.name) {service in
                    NavigationLink(value: service) {
                        HStack{
                            Image(systemName: service.imageName)
                                .font(.system(size: spacing * ServiceButtons().buttonTextSizeFactor))
                                .padding(screenWidth * ServiceButtons().buttonContentsPadFactor)
                            Spacer()
                            Text(service.name)
                                .font(.system(size: spacing * ServiceButtons().buttonTextSizeFactor))
                                .padding(screenWidth * ServiceButtons().buttonContentsPadFactor)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .foregroundColor(service.color)
                        .background(Color.gray.opacity(ServiceButtons().buttonBGOpacityFactor))
                        .cornerRadius(spacing * ServiceButtons().buttonCornerRadFactor)
                    }
                }
                .navigationDestination(for: Service.self){ platform in
                    ZStack{
                        Image(systemName: platform.imageName)
                            .font(.system(size: spacing * 2))
                            .foregroundColor(platform.color)
                            .padding()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .navigationTitle("Services")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationLink(destination: UserView()){
                    HStack {
                        Image(systemName: "person.crop.circle")
                        Text(userID)
                            .font(.headline)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct Service: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

#Preview {
    ServicesView()
}
