//
//  ServicesView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 14.06.24.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        let spacing = screenWidth * ServiceButtons().spacingFactor
        //let columns = [GridItem(.flexible(), spacing: spacing),GridItem(.flexible(), spacing: spacing)]
        let buttonWidth = (screenWidth - (ServiceButtons().buttonWidthMultiple * spacing)) / ServiceButtons().buttonWidthFactor
        let buttonHeight = screenHeight * ServiceButtons().buttonHeightFactor
        
        NavigationStack {
            ScrollView{
                ForEach(ServiceButtons().services, id: \.name) {platform in
                    NavigationLink(value: platform) {
                        HStack{
                            Image(systemName: platform.imageName)
                                .padding(screenWidth * ServiceButtons().buttonContentsPadFactor)
                            Spacer()
                            Text(platform.name)
                                .font(.system(size: spacing * ServiceButtons().buttonTextSizeFactor))
                                .padding(screenWidth * ServiceButtons().buttonContentsPadFactor)
                        }
                        .frame(width: buttonWidth, height: buttonHeight)
                        .foregroundColor(platform.color)
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
