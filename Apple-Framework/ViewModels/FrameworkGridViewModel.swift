//
//  FrameworkGridViewModel.swift
//  Apple-Framework
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Published var isShowingDetailView = false
    @Published var isShowingListView = true
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
}
