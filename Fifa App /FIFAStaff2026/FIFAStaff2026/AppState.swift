//
//  AppState.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import Foundation
import SwiftUI

@MainActor
class AppState: ObservableObject {
    @Published var currentUser: User
    @Published var tasks: [Task]
    @Published var emergencies: [Emergency]
    @Published var chatThreads: [ChatThread]
    
    init() {
        // Mock current user – in real backend, this comes from login
        self.currentUser = User(
            id: "user1",
            name: "Alex Martinez",
            role: .security,
            stadium: "MetLife Stadium",
            gate: "Gate A",
            zone: "Zone 12",
            phone: "+1 (555) 123-4567"
        )
        
        self.tasks = [
            Task(
                id: "task1",
                title: "Pre-match exit check",
                details: "Verify all emergency exits in Zone 12 are clear.",
                status: .pending
            ),
            Task(
                id: "task2",
                title: "Barrier inspection",
                details: "Check barriers near Section 104.",
                status: .inProgress
            ),
            Task(
                id: "task3",
                title: "Post-match sweep",
                details: "Final sweep of stands after crowd leaves.",
                status: .completed
            )
        ]
        
        self.emergencies = []   // Starts empty
        
        // Simple mock chat threads
        let now = Date()
        self.chatThreads = [
            ChatThread(
                id: "thread1",
                title: "Supervisor",
                isGroup: false,
                messages: [
                    ChatMessage(
                        id: "m1",
                        senderName: "Supervisor",
                        text: "Reminder: focus on exits before kick-off.",
                        sentAt: now.addingTimeInterval(-1800),
                        isCurrentUser: false
                    ),
                    ChatMessage(
                        id: "m2",
                        senderName: "You",
                        text: "Understood, Zone 12 checks in progress.",
                        sentAt: now.addingTimeInterval(-1200),
                        isCurrentUser: true
                    )
                ]
            ),
            ChatThread(
                id: "thread2",
                title: "Gate A Team",
                isGroup: true,
                messages: [
                    ChatMessage(
                        id: "m3",
                        senderName: "Team Member 1",
                        text: "Crowd building up at entrance.",
                        sentAt: now.addingTimeInterval(-900),
                        isCurrentUser: false
                    )
                ]
            )
        ]
    }
    
    // Simple helper to add an emergency
    func reportEmergency(_ emergency: Emergency) {
        emergencies.insert(emergency, at: 0)
    }
    
    // Simple helper to update task status
    func updateTask(_ task: Task, to newStatus: TaskStatus) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].status = newStatus
        }
    }
}

