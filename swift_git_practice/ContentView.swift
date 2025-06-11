//
//  ContentView.swift
//  swift_git_practice
//
//  Created by 武井まりあ on 2025/06/10.
//

import SwiftUI

struct ContentView: View {
    //タブ項目を保持する
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            TabContent1().tabItem {
                Image(systemName: "house")
                Text("ホーム")
            }
            TabContent2().tabItem{
                Image(systemName: "magnifyingglass")
                Text("検索")
            }
            TabContent3().tabItem{
                 Image(systemName: "square.and.arrow.up")
                Text("追加")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
