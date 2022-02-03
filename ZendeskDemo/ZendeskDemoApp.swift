//
//  ZendeskDemoApp.swift
//  ZendeskDemo
//
//  Created by Paco on 02/02/22.
//

import SwiftUI
import ZendeskCoreSDK
import SupportProvidersSDK
import AnswerBotProvidersSDK
import ChatProvidersSDK

@main
struct ZendeskDemoApp: App {
    init() {
        initializeZendesk()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    func initializeZendesk() {
        Zendesk.initialize(appId: "5100cea3467934c35fafa5114b7cf4dd8bdce486d07846a8",
                           clientId: "mobile_sdk_client_96be90ae922b8fee3090",
                           zendeskUrl: "https://michelada.zendesk.com")
        Support.initialize(withZendesk: Zendesk.instance)
        AnswerBot.initialize(withZendesk: Zendesk.instance, support: Support.instance!)
        Chat.initialize(accountKey: "Jc3jhADf553AHRniLK8GyrTomWAU7pKy")
        let identity = Identity.createAnonymous(name: "Paco", email: "paco@michelada.io")
        Zendesk.instance?.setIdentity(identity)
    }
}
