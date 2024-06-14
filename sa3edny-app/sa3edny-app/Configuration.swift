//
//  Configuration.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 11.06.24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ServiceButtons {
    let services: [Service] = [  .init(name: "Carpenter", imageName: "chair.fill", color: .brown),
                                 .init(name: "Electrician", imageName: "bolt.slash.fill", color: .red),
                                 .init(name: "Plumber", imageName: "sink.fill", color: .cyan),
                                 .init(name: "Maintainance", imageName: "tv.fill", color: .indigo),
                                 .init(name: "Pet Grooming", imageName: "cat.fill", color: .gray),
                                 .init(name: "Cleaner", imageName: "washer.fill", color: .teal),
                                 .init(name: "Gardner", imageName: "tree.fill", color: .green),
                                 .init(name: "Other", imageName: "wrench.and.screwdriver.fill", color: .orange)
                            ]

    let spacingFactor: CGFloat = 0.10
    let buttonWidthMultiple: CGFloat = 0.5
    let buttonWidthFactor: CGFloat = 1
    let buttonHeightFactor: CGFloat = 0.1
    let buttonTextSizeFactor: CGFloat = 0.47
    let buttonBGOpacityFactor: CGFloat = 0.2
    let buttonCornerRadFactor: CGFloat = 0.3
    let buttonContentsPadFactor: CGFloat = 0.1
}
