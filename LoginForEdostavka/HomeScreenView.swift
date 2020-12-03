//
//  HomeScreenView.swift
//  LoginForEdostavka
//
//  Created by Yan Tsenter on 12/1/20.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        Text("Welcome to the home screen")
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().environmentObject(ViewRouter())
    }
}
