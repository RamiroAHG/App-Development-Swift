//
//  Models.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import Foundation

enum Role: String, Codable, CaseIterable, Identifiable {
    case security = "Security"
    case supervisor = "Supervisor"
    case medical = "Medical"
    case operations = "Operations"
    
    var id: String { rawValue }
}

struct User: Identifiable, Codable {
    let id: String
    var name: String
    var role: Role
    var stadium: String
    var gate: String
    var zone: String
    var phone: String
}

enum TaskStatus: String, Codable, CaseIterable, Identifiable {
    case pending = "Pending"
    case inProgress = "In Progress"
    case completed = "Completed"
    
    var id: String { rawValue }
}

struct Task: Identifiable, Codable {
    let id: String
    var title: String
    var details: String
    var status: TaskStatus
}

enum EmergencyType: String, CaseIterable, Identifiable {
    case medical = "Medical emergency"
    case fire = "Fire / smoke"
    case violence = "Violence / altercation"
    case suspiciousObject = "Suspicious object"
    case crowdIssue = "Crowd issue"
    case other = "Other"
    
    var id: String { rawValue }
}

enum Severity: String, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case critical = "Critical"
    
    var id: String { rawValue }
}

struct Emergency: Identifiable, Codable {
    let id: String
    var type: EmergencyType
    var zone: String
    var severity: Severity
    var needsImmediateBackup: Bool
    var description: String
    var status: String               // e.g. "Submitted", "In progress", "Resolved"
    var createdAt: Date
    var updates: [String]            // simple timeline text for now
}

struct ChatMessage: Identifiable, Codable {
    let id: String
    let senderName: String
    let text: String
    let sentAt: Date
    let isCurrentUser: Bool
}

struct ChatThread: Identifiable, Codable {
    let id: String
    var title: String        // e.g. "Gate A Team", "Supervisor"
    var isGroup: Bool
    var messages: [ChatMessage]
}

