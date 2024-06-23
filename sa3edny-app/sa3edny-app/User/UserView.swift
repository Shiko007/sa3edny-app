//
//  UserView.swift
//  sa3edny-app
//
//  Created by Sherif Yasser on 20.06.24.
//

import SwiftUI

struct UserView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    @Environment(\.dismiss) var dismiss
    @State var presentingConfirmationDialog = false
    
    private func deleteAccount() {
        Task {
            if await authViewModel.deleteAccount() == true {
                dismiss()
            }
        }
    }
    
    var body: some View {
        let userID = authViewModel.user?.email ?? "unknown"
        VStack{
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minHeight: 200, maxHeight: 200)
                .foregroundColor(.brown)
            Text(userID)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.brown)
                .padding()
        }
        .background(Divider(),alignment: .bottom)
        .padding()
        Spacer()
        VStack{
            Button(role: .destructive, action: {presentingConfirmationDialog.toggle()}) {
                Text("Delete Account")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding(.vertical, 6)
            .padding(.bottom, 4)
            Button(role: .cancel, action: authViewModel.signOut) {
                Text("Signout")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .buttonStyle(.borderedProminent)
            .tint(.brown)
            .padding(.vertical, 6)
            .padding(.bottom, 4)
        }
        .padding()
        .confirmationDialog("Deleting your account is permanent. Do you want to delete your account?",
                            isPresented: $presentingConfirmationDialog, titleVisibility: .visible) {
            Button("Delete Account", role: .destructive, action: deleteAccount)
            Button("Cancel", role: .cancel, action: { })
        }
    }
}

#Preview {
    UserView()
}
