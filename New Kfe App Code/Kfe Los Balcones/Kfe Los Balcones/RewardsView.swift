//
//  RewardsView.swift
//  Kfe Los Balcones
//
//  Created by Ramiro Herdocia on 11/25/25.
//

import SwiftUI

struct RewardsView: View {
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Loyalty Rewards")
                    .font(.largeTitle.bold())
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(session.totalPoints) Points")
                        .font(.title.bold())
                    
                    ProgressView(value: progressToNextReward)
                        .tint(.blue)
                    
                    Text("Progress to next reward")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Text("How it works")
                    .font(.headline)
                
                Text("Earn 1 point for every C$10 spent. Collect points to unlock rewards!")
                    .font(.subheadline)
                
                VStack(spacing: 12) {
                    rewardRow(title: "Free Coffee", points: 100)
                    rewardRow(title: "Free Pastry", points: 200)
                    rewardRow(title: "Free Frappee", points: 300)
                    rewardRow(title: "Free Lunch", points: 400)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Loyalty Rewards")
    }
    
    private var progressToNextReward: Double {
        let thresholds = [100, 200, 300, 400]
        guard let next = thresholds.first(where: { session.totalPoints < $0 }) else {
            return 1.0
        }
        let previous = thresholds.filter { $0 < next }.last ?? 0
        let range = Double(next - previous)
        let current = Double(session.totalPoints - previous)
        return max(0.0, min(1.0, current / range))
    }
    
    private func rewardRow(title: String, points: Int) -> some View {
        HStack {
            Image(systemName: "rosette")
            Text(title)
            Spacer()
            Text("\(points) pts")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}
