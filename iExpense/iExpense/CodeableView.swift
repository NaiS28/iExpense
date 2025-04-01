//
//  CodeableView.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct CodeableView: View {
    @State private var user2 = User2(firstName: "Nai", lastName: "Saephan")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(user2) {
                UserDefaults.standard.set(data, forKey: "UserData")

                // That accesses UserDefaults directly rather than going through @AppStorage, because the @AppStorage property wrapper just doesn’t work here.
//
//                That data constant is a new data type called, perhaps confusingly, Data. It’s designed to store any kind of data you can think of, such as strings, images, zip files, and more. Here, though, all we care about is that it’s one of the types of data we can write straight into UserDefaults.
//
//                When we’re coming back the other way – when we have JSON data and we want to convert it to Swift Codable types – we should use JSONDecoder rather than JSONEncoder(), but the process is much the same.
            }
        }
    }
}

#Preview {
    CodeableView()
}
