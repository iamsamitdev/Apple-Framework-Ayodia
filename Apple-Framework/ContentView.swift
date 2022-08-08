//
//  ContentView.swift
//  Apple-Framework
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FrameworkGridView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.2x2")
                }
            FrameworkListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
