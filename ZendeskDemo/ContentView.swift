//
//  ContentView.swift
//  ZendeskDemo
//
//  Created by Paco on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var name: String
    @State var email: String
    var isButtonDisabled: Bool {
        return email.isEmpty || name.isEmpty
    }
    var buttonColor: Color {
        return isButtonDisabled ? .gray : .blue
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                } header: {
                    Text("User Data")
                }
                Section {
                    ZStack {
                        NavigationLink {
                            ZendeskView(name: name, email: email)
                                .onAppear(perform: {
                                    saveData()
                                })
                        } label: {
                            EmptyView()
                        }
                        .disabled(isButtonDisabled)
                        .buttonStyle(PlainButtonStyle())
                        .opacity(0)
                        Text("Start Chat").foregroundColor(buttonColor)
                    }
                }
            }
            .navigationTitle("Zendesk")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func saveData() {
        UserDefaults.standard.set(name, forKey: "user.name")
        UserDefaults.standard.set(email, forKey: "user.email")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "Paco", email: "francisco.chacon@michelada.io")
    }
}
