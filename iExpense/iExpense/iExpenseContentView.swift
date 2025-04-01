//
//  iExpenseContentView.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/26/25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct iExpenseContentView: View {
    @State private var expenses = Expenses()

    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)

                                Text(item.type)
                            }

                            Spacer()


                            HStack {
                                // Challenge 1: Use the user’s preferred currency, rather than always using US dollars
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

                                Divider()

                                // Self challenge and fun
                                image(for: item.amount)
                                    .padding(5)
                            }
                        }
                        .foregroundColor(color(for: item.amount))

                    }
                    .onDelete(perform: removeItemsPersonal)
                }

                Section("Business") {
                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)

                                Text(item.type)
                            }

                            Spacer()


                            HStack {
                                // Challenge 1: Use the user’s preferred currency, rather than always using US dollars
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

                                Divider()

                                // Self challenge and fun
                                image(for: item.amount)
                                    .padding(5)
                            }
                        }
                        .foregroundColor(color(for: item.amount))

                    }
                    .onDelete(perform: removeItemsBusiness)
                }


            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    func removeItemsPersonal(at offsets: IndexSet) {
        let personalItems = expenses.items.filter { $0.type == "Personal" }
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == personalItems[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }

    func removeItemsBusiness(at offsets: IndexSet) {
        let businessItems = expenses.items.filter { $0.type == "Business" }
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == businessItems[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }

    func color(for amount: Double) -> Color {
        if amount <= 10 {
            return .blue
        } else if amount >= 100 {
            return .red
        } else {
            return .orange
        }
    }

    // Self challenge and fun
    func image(for amount: Double) -> Image {
        if amount <= 10 {
            return Image(systemName: "star.circle.fill")
        } else if amount >= 100 {
            return Image(systemName: "xmark.circle.fill")
        } else {
            return Image(systemName: "exclamationmark.triangle.fill")
        }
    }
}

#Preview {
    iExpenseContentView()
}
