//
//  ChatView.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedThread: ChatThread?
    @State private var messageText: String = ""
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 0) {
                // Thread list
                List(appState.chatThreads) { thread in
                    Button {
                        selectedThread = thread
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(thread.title)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            if let last = thread.messages.last {
                                Text(last.text)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
                .frame(width: 200)
                
                Divider()
                
                // Chat messages
                if let thread = selectedThread ?? appState.chatThreads.first {
                    ChatThreadView(thread: thread)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("Select a conversation")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Chat")
        }
    }
}

struct ChatThreadView: View {
    let thread: ChatThread
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(thread.messages) { message in
                        HStack {
                            if message.isCurrentUser { Spacer() }
                            VStack(alignment: .leading, spacing: 4) {
                                Text(message.senderName)
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                Text(message.text)
                                    .padding(8)
                                    .background(message.isCurrentUser ? Color.accentColor.opacity(0.2) : Color.gray.opacity(0.15))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            if !message.isCurrentUser { Spacer() }
                        }
                    }
                }
                .padding()
            }
            
            // Quick buttons
            HStack {
                Button("Arrived") { messageText = "Arrived at location." }
                Button("On my way") { messageText = "On my way." }
                Button("Resolved") { messageText = "Issue resolved." }
            }
            .buttonStyle(.bordered)
            .font(.caption)
            .padding(.horizontal)
            
            // Text field
            HStack {
                TextField("Type a message…", text: $messageText)
                    .textFieldStyle(.roundedBorder)
                Button("Send") {
                    // mock only
                    messageText = ""
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}


