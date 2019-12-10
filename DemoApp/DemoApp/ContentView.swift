//
//  ContentView.swift
//  DemoApp
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI
import PostsUI


struct ContentView: View {

    private let postsDataProviderA = PostsDataProviderA()
    private let postsDataProviderB = PostsDataProviderB()

    var body: some View {
        TabView {
            NavigationView {
                PostView(dataProvider: postsDataProviderA)
                    .navigationBarTitle("Posts", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "safari")
                Text("URLSession")
            }

            NavigationView {
                PostView(dataProvider: postsDataProviderB)
                    .navigationBarTitle("Posts", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "flame")
                Text("Alamofire")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
