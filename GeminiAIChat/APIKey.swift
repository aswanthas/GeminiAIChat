//
//  APIKey.swift
//  GeminiAIChat
//
//  Created by Aswanth K on 20/10/24.
//

import Foundation
enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist")
        else {
            fatalError("Couldn't find the file 'GenerativeAI-info.plist1'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find the key 'API-KEY' in 'GenerativeAI-info.plist1'.")
        }
        if value.starts(with: "_") {
            fatalError("Follow the instruction at https://ai.google.dev/tutorials/setup to get an api key")
        }
        return value
    }
}

