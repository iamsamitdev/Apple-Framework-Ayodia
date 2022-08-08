//
//  FrameworkListView.swift
//  Apple-Framework
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination: FrameworkDetailView(
                        framework: framework,
                        isShowingDetailView: $viewModel.isShowingDetailView,
                        isShowingListView: $viewModel.isShowingListView
                    )){
                        HStack {
                            Image(framework.imageName)
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text(framework.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .scaledToFit()
                                .padding()
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
        .navigationViewStyle(.stack)
    }
}

struct FrameworkListView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkListView()
    }
}
