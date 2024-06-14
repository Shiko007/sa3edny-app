//
//  LoginView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 13.06.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var navigated = false
    
    let spacing = screenWidth * ServiceButtons().spacingFactor
    var body: some View {
        if(navigated){
            ServicesView()
        }
        else{
            VStack{
                Image(systemName: "person.badge.key.fill")
                    .font(.system(size: spacing * 6))
                    .foregroundColor(.brown)
                    .padding()
                Text("Login")
                    .padding()
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.brown)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Image(systemName: "at")
                    TextField("Email" , text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .submitLabel(.next)
                }
                .padding()
                HStack{
                    Image(systemName: "key")
                    SecureField("Password" , text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                Button(action: {
                    self.navigated.toggle()
                }) {
                    Text("Login")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                        .padding()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
