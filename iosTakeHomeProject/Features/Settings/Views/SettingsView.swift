//
//  SettingsView.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 01/10/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(UserDefaultsKey.hapticsEnabled) private var isHapticsEnabled: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                haptics
            }
            .navigationTitle("Settings")
        }
        
    }
}

private extension SettingsView {
    
    var haptics: some View {
        Toggle("Enable Haptics", isOn: $isHapticsEnabled)
    }
}

#Preview {
    SettingsView()
}
