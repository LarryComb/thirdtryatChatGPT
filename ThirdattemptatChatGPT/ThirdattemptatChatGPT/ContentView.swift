//
//  ContentView.swift
//  ThirdattemptatChatGPT
//
//  Created by LARRY COMBS on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State var chatMessages: [ChatMessage] = ChatMessage.sampleMessages
    @State var messageText: String = ""
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack {
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Enter A Message", text: $messageText){
                    
                }
                    .foregroundColor(.blue)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                    
                }
            }
        }
        .padding()
    }
    
    func messageView(message: ChatMessage) -> some View {
        HStack{
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black).padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.1)).cornerRadius(16)
            if message.sender == .GPT { Spacer() }
        }
    }
    
    func sendMessage() {
        messageText = ""
        print(messageText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChatMessage{
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case GPT
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "SampleMessage From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "SampleMessage From GPT", dateCreated: Date(), sender: .GPT),
        ChatMessage(id: UUID().uuidString, content: "SampleMessage From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "SampleMessage From GPT", dateCreated: Date(), sender: .GPT),
    ]
    
}
