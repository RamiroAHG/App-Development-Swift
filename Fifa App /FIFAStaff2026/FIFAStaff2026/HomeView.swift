//
//  HomeView.swift
//  FIFAStaff2026
//
//  Created by Ramiro Herdocia on 12/4/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Shift info
                    shiftCard
                    
                    // Tasks / checklist
                    tasksSection
                    
                    // Active emergencies
                    emergenciesSection
                    
                    // Quick actions
                    quickActionsSection
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
    
    private var shiftCard: some View {
        let user = appState.currentUser
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("Current Shift")
                .font(.headline)
            Text(user.stadium)
                .font(.subheadline)
            Text("Gate: \(user.gate) • Zone: \(user.zone)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("Role: \(user.role.rawValue)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    private var tasksSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Checklist")
                    .font(.headline)
                Spacer()
            }
            
            ForEach(appState.tasks) { task in
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(task.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(task.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(statusColor(task.status).opacity(0.15))
                            .foregroundStyle(statusColor(task.status))
                            .clipShape(Capsule())
                    }
                    Text(task.details)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    // Quick buttons to change status
                    HStack {
                        Button("Pending") {
                            appState.updateTask(task, to: .pending)
                        }
                        .buttonStyle(.bordered)
                        
                        Button("In progress") {
                            appState.updateTask(task, to: .inProgress)
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Completed") {
                            appState.updateTask(task, to: .completed)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .font(.caption)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
    
    private var emergenciesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Active Emergencies")
                .font(.headline)
            
            if appState.emergencies.isEmpty {
                Text("No active emergencies.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(appState.emergencies) { emergency in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(emergency.type.rawValue)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(emergency.severity.rawValue)
                                .font(.caption2)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(.red.opacity(0.15))
                                .foregroundStyle(.red)
                                .clipShape(Capsule())
                        }
                        Text("Zone: \(emergency.zone)")
                            .font(.caption)
                        Text("Status: \(emergency.status)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
    
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Quick Actions")
                .font(.headline)
            
            HStack {
                Button {
                    // later: navigate to Emergency tab
                } label: {
                    VStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.title2)
                        Text("Report\nEmergency")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    // later: navigate to Chat tab (supervisor)
                } label: {
                    VStack {
                        Image(systemName: "person.2.fill")
                            .font(.title2)
                        Text("Contact\nSupervisor")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
    }
    
    private func statusColor(_ status: TaskStatus) -> Color {
        switch status {
        case .pending:
            return .orange
        case .inProgress:
            return .blue
        case .completed:
            return .green
        }
    }
}
