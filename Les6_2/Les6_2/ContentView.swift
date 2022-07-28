//
//  ContentView.swift
//  Les6_2
//
//  Created by Роман Чикишев on 28.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var fio: String = ""
    @State private var groups: String = ""
    var body: some View {
        CellViewFIO{
            TextField(
            "User name",
            text: $fio
        )}
        CellViewGroups{TextField(
            "User groups",
            text: $groups
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CellViewFIO<Content: View>: View {
    let content: Content
    @State private var fio: String = ""

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
        TextField(
              "User name",
              text: $fio
          )
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
          .border(.secondary)
        }
    }
}

struct CellViewGroups<Content: View>: View {
    let content: Content
    @State private var groups: String = ""
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
        TextField(
              "User groups",
              text: $groups
          )
          .textInputAutocapitalization(.never)
          .disableAutocorrection(true)
          .border(.secondary)
        }
    }
}
