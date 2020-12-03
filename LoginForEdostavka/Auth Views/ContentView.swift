//
//  ContentView.swift
//  LoginForEdostavka
//
//  Created by Yan Tsenter on 12/1/20.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30.0) {
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: 250)
                        .frame(height: 40)
                        .background(Color.orange)
                        .cornerRadius(100)
                }
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: 250)
                        .frame(height: 40)
                        .background(Color.orange)
                        .cornerRadius(100)
                }
                }
            .offset(y: 200)
            }
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
