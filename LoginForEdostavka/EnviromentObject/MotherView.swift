//
//  MotherView.swift
//  LoginForEdostavka
//
//  Created by Yan Tsenter on 12/2/20.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
            case .page1:
                ContentView()
            case .page2:
                HomeScreenView()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
