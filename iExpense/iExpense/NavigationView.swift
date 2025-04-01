//
//  NavigationView.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ContentView()) { Text("ContentViewSecondView")
                }

                NavigationLink(destination: ClassObservableView()) { Text("ClassObservableView")
                }


                NavigationLink(destination: CodeableView()) { Text("CodeableView")
                }

                NavigationLink(destination: iExpenseContentView()) { Text("iExpenseView")
                }

                NavigationLink(destination:  OnDeleteView()) {
                    Text("OnDeleteView")
                }

                NavigationLink(destination:  UserDefaultsView()) {
                    Text("UserDefaultsView")
                }
            }
        }
    }
}

#Preview {
    NavigationView()
}
