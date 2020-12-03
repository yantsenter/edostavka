//
//  SignUpView.swift
//  LoginForEdostavka
//
//  Created by Yan Tsenter on 12/1/20.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore
import UIKit

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var willMoveToNextScreen = true
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 20.0) {
            TextField(" First Name", text: $firstName)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                                self.mode.wrappedValue.dismiss()
                            }){
                                Image("back-arrow").resizable()
                                    .frame(width: 32.0, height: 32.0)
                            })
            TextField(" Last Name", text: $lastName)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
            TextField(" Email", text: $email)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
            TextField(" Password", text: $password)
                .frame(height: 35.0)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 0.5))
            Button(action: {
                
                // Create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    // Check for errors
                    
                    if err != nil {
                        // There was an error creating the user
                        print("Error creating user")
                    }
                    else {
                        // User was created succesfully, now store the first and last names
                        let db = Firestore.firestore()
                        
                        db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { (error) in
                            
                            if error != nil {
                                //Show error message
                                print("Error saving user data")
                            }
                        }
                        // Transition to the homescreen
                        viewRouter.currentPage = .page2
                    }
                }
            }) {
                Text("Sign Up")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: 250)
                    .frame(height: 40)
                    .background(Color.orange)
                    .cornerRadius(100)
            }
 
        }
            
        .frame(width: 300.0)
        //.offset(y: -200.0)
        }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(ViewRouter())
    }
}
