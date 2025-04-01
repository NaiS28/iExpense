//
//  ClassObservable.swift
//  iExpense
//
//  Created by Saephan, Nai Y (Contractor) on 3/17/25.
//

import SwiftUI
import Observation


// change struct to class and add @observable so @State can track changes. User class when you want all instances to change.
@Observable
class User {
    var firstName = "Nai"
    var lastName = "Saephan"
}

struct ClassObservableView: View {
    @State private var user = User()

    var body: some View {
        VStack {
            Spacer()

            Text("Your name is \(user.firstName) \(user.lastName)")

            Spacer()

            VStack(alignment: .leading) {
                Text("First name")
                TextField("First name", text: $user.firstName)

                Text("Last name")
                TextField("Last name", text: $user.lastName)
            }

            Spacer()
        }
    }
}

#Preview {
    ClassObservableView()
}
