//
//  UserDefaultsView.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI


// MARK: - Method 3 @AppStorage()

// @AppStorage() property wrapper around UserDefaults
struct UserDefaultsView: View {
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

// MARK: - Method 2 UserDefaults

// Reading the data back, rather than start with tapCount set to 0 we should instead make it read the value back from UserDefaults like this:
//struct UserDefaultsView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}

// MARK: - Method 1 UserDefaults

//struct UserDefaultsView: View {
//    @State private var tapCount = 0
//
//    var body: some View {
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}

#Preview {
    UserDefaultsView()
}
