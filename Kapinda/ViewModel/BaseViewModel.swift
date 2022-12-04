//
//  BaseViewModel.swift
//  Kapinda
//
//  Created by dogukangokova on 22.09.2022.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var currentTab: Tab = .Home
    
    @Published var homeTab = "İçecekler"
    
    @Published var currentProduct: Product?
    @Published var showDetail = false
}

enum Tab: String{
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}


