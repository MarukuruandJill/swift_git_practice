//
//  TabContent1.swift
//  swift_git_practice
//
//  Created by 武井まりあ on 2025/06/10.
//

import SwiftUI

// APIのデータ構造に合わせる
struct Fruit: Identifiable, Codable {
    let id: Int
    let name: String
}

struct TabContent1: View {
    // 取得したデータを入れる配列
    @State private var fruits: [Fruit] = []
    
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                Text(fruit.name)
            }
            .navigationTitle("Fruits")
            .task {
                await fetchFruits()
            }
        }
    }
    
    // async/await でAPIからデータ取得
    func fetchFruits() async {
        guard let url = URL(string: "http://localhost:8080/fruits") else {
            print("URLが無効です")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedFruits = try? JSONDecoder().decode([Fruit].self, from: data) {
                // メインスレッドでUI更新
                await MainActor.run {
                    fruits = decodedFruits
                }
            } else {
                print("JSONデコードに失敗しました")
            }
        } catch {
            print("通信エラー: \(error.localizedDescription)")
        }
    }
}

#Preview {
    TabContent1()
}
