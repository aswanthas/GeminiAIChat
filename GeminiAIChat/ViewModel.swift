//
//  ViewModel.swift
//  GeminiAIChat
//
//  Created by Aswanth K on 20/10/24.
//

import Foundation
import GoogleGenerativeAI

final class ViewModel: ObservableObject {
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    @Published var aiResponse = "Hello! How can I helpn you?"
    @Published var alertMessage = ""
    @Published var isShowAlert: Bool = false
    func sendMessage(input: String) {
        aiResponse  = ""
        Task {
            do {
                let reponse = try await model.generateContent(input)
                DispatchQueue.main.sync {
                    guard let text = reponse.text else {
                        alertMessage = "Sorry, Could not process that. \nPlease try again"
                        return
                    }
                    aiResponse = text
                }
            } catch {
                DispatchQueue.main.sync {
                    aiResponse  = "Something went wrong! \n\(error.localizedDescription)"
                }
            }
        }
    }
}
