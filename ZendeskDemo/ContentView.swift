//
//  ContentView.swift
//  ZendeskDemo
//
//  Created by Paco on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var sections: [String] = ["Support Chat"]
    var body: some View {
        NavigationView {
            List(sections, id: \.self) { section in
                NavigationLink {
                    ZendeskView(user: "Test 123")
                } label: {
                    Text(section)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Zendesk")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
