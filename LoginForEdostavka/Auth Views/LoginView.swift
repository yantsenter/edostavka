//
//  LoginView.swift
//  LoginForEdostavka
//
//  Created by Yan Tsenter on 12/1/20.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 20.0) {
            TextField(" Email", text: $email)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                                self.mode.wrappedValue.dismiss()
                            }){
                                Image("back-arrow").resizable()
                                    .frame(width: 32.0, height: 32.0)
                            })
            TextField(" Password", text: $password)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
            Button(action: {
                
                // Validate text fields
                
                // Create cleaned versions of the text field
                
                // Sign in the user
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        // Couldn't sign in
                        print("The username or password you entered is incorrect")
                    }
                    else {
                        // Transition to the home screen
                        viewRouter.currentPage = .page2
                    }
                }
                
            }) {
                Text("Login")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: 250)
                    .frame(height: 40)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .frame(width: 300.0)
        //.offset(y: -200.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(ViewRouter())
    }
}
