//
//  FrameworkGridView.swift
//  Apple-Framework
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks){ framework in
                        VStack {
                            Image(framework.imageName)
                                .resizable()
                                .frame(width: 90, height: 90)
                            Text(framework.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .scaledToFit()
                        }
                        .padding()
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView(
                    framework: viewModel.selectedFramework ?? MockData.frameworks[0],
                    isShowingDetailView: $viewModel.isShowingDetailView,
                    isShowingListView: $viewModel.isShowingListView
                )
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
