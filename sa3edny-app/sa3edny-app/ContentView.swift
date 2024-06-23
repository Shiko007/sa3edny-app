//
//  ContentView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some View {
        if(authViewModel.authenticationState != .authenticated){
            AuthenticationView()
                .environmentObject(AuthenticationViewModel())
        }
        else if(authViewModel.authenticationState == .authenticated){
            ServicesView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}
