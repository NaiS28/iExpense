//
//  ContentView.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String

    var body: some View {
        Text("Hello \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }

}

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Nai")
        }
    }
}

#Preview {
    ContentView()
}
