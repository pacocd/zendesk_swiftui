//
//  ZendeskView.swift
//  ZendeskDemo
//
//  Created by Paco on 03/02/22.
//

import SwiftUI
import MessagingSDK
import AnswerBotSDK
import ChatSDK
import SupportSDK

struct ZendeskView: UIViewControllerRepresentable {
    var user: String

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        do {
            let configuration = MessagingConfiguration()
            let answerBotEngine = try AnswerBotEngine.engine()
            let supportEngine = try SupportEngine.engine()
            let chatEngine = try ChatEngine.engine()

            return try Messaging.instance.buildUI(engines: [answerBotEngine, supportEngine, chatEngine],
                                                  configs: [configuration])
        } catch let error {
            print(error.localizedDescription)
            return UIViewController()
        }

    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    class Coordinator: NSObject {
        var parent: ZendeskView

        init(_ parent: ZendeskView) {
            self.parent = parent
        }
    }
}
