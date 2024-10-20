//
//  ContentView.swift
//  GeminiAIChat
//
//  Created by Aswanth K on 20/10/24.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State private var textInput = ""
    var body: some View {
        VStack {
            ScrollView {
                Text(viewModel.aiResponse)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
            HStack {
                TextField("Enter a message", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(Color.black)
                Button {
                    viewModel.sendMessage(input: textInput)
                    textInput = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                
            }
        }
        .foregroundStyle(Color.white)
        .padding()
        .background(Color.black)
        .alert(isPresented: $viewModel.isShowAlert) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ContentView()
}
