//
//  ContentViewOnDelete.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI

struct OnDeleteView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    // We could move '(numbers, id: \.self)' to the List view, but the onDelete() modifier only exists on ForEach, so if we want users to delete items from a list we must put the items inside a ForEach.
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                Button("Add Row") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }

    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    OnDeleteView()
}
