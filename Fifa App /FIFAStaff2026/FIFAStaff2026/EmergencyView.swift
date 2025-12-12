//
//  EmergencyView.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

struct EmergencyView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var selectedType: EmergencyType = .medical
    @State private var zone: String = ""
    @State private var selectedSeverity: Severity = .medium
    @State private var needsBackup: Bool = true
    @State private var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Emergency Type") {
                    Picker("Type", selection: $selectedType) {
                        ForEach(EmergencyType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
                
                Section("Location") {
                    TextField("Zone (e.g., Zone 12, Section 104)", text: $zone)
                }
                
                Section("Severity") {
                    Picker("Severity", selection: $selectedSeverity) {
                        ForEach(Severity.allCases) { sev in
                            Text(sev.rawValue).tag(sev)
                        }
                    }
                    Toggle("Need immediate backup", isOn: $needsBackup)
                }
                
                Section("Description") {
                    TextField("Short description", text: $description, axis: .vertical)
                        .lineLimit(2...4)
                }
                
                Section {
                    Button {
                        submitEmergency()
                    } label: {
                        Text("Submit Emergency")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(zone.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                // List of emergencies for status/timeline
                if !appState.emergencies.isEmpty {
                    Section("Recent Emergencies") {
                        ForEach(appState.emergencies) { emergency in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(emergency.type.rawValue)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Text(emergency.status)
                                        .font(.caption2)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.blue.opacity(0.15))
                                        .clipShape(Capsule())
                                }
                                Text("Zone: \(emergency.zone)")
                                    .font(.caption)
                                Text("Severity: \(emergency.severity.rawValue)")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                
                                if !emergency.updates.isEmpty {
                                    Text("Timeline:")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                    ForEach(emergency.updates, id: \.self) { update in
                                        Text("• \(update)")
                                            .font(.caption2)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Emergency")
        }
    }
    
    private func submitEmergency() {
        let newEmergency = Emergency(
            id: UUID().uuidString,
            type: selectedType,
            zone: zone,
            severity: selectedSeverity,
            needsImmediateBackup: needsBackup,
            description: description,
            status: "Submitted",
            createdAt: Date(),
            updates: ["Submitted by \(appState.currentUser.name)"]
        )
        
        appState.reportEmergency(newEmergency)
        
        // Reset form
        zone = ""
        description = ""
        selectedType = .medical
        selectedSeverity = .medium
        needsBackup = true
    }
}

