//
//  TabContent2.swift
//  swift_git_practice
//
//  Created by 武井まりあ on 2025/06/10.
//

import SwiftUI

struct TabContent2: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var subscribe: Bool = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("ユーザー情報")){
                    TextField("名前", text: $name)
                    TextField("メールアドレス", text: $email).keyboardType(.emailAddress)
                }
                Section{
                    Toggle(isOn: $subscribe){
                        Text("ニュースレターを購読する")
                    }
                }
                Section{
                    Button(action: {
                        print("送信: 名前　= \(name), メール = \(email), 購読 = \(subscribe)")
                    }){
                        Text("送信")
                    }
                }
            }.navigationTitle("登録フォーム")
        }
    }
}

#Preview {
    TabContent2()
}
