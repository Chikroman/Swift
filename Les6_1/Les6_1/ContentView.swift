//
//  ContentView.swift
//  Les6_1
//
//  Created by Роман Чикишев on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
        TextField(
              "User name (email address)",
              text: $username
          )
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
          .border(.secondary)
        
        TextField(
              "password",
              text: $password
          )
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
          .border(.secondary)
        
        Button("Войти") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 50)
        .background(.red)
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
