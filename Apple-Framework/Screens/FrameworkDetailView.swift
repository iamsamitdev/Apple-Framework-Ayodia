//
//  FrameworkDetailView.swift
//  Apple-Framework
//
//  Created by Samit Koyom on 29/7/2565 BE.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Binding var isShowingDetailView: Bool
    @Binding var isShowingListView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            HStack {
                
                Spacer()
                
                if isShowingListView {
                    Button {
                        // print("Pressed Close")
                        isShowingDetailView = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                    }
                }
                
            }
            .padding()
            
            Spacer()
            
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                // print("Tapped")
                isShowingSafariView = true
            } label: {
                Text("Learn More")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(
            framework: MockData.frameworks[0],
            isShowingDetailView: .constant(false),
            isShowingListView: .constant(false)
        )
    }
}
