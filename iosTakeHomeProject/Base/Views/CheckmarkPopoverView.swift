//
//  CheckmarkPopoverView.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 01/10/2025.
//

import SwiftUI

struct CheckmarkPopoverView: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle, design: .rounded).bold())
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    CheckmarkPopoverView()
        .padding()
        .background(.blue)
        
}
