//
//  ToastView.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 18/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        HStack(spacing: 10.0) {
            Image(systemName: "checkmark.circle.fill")
                .font(.title2)
                .foregroundStyle(Color(hex: 0x18753C))
            Text("La demande a bien été envoyée")
                .font(.callout)
        }
        .padding(.horizontal, 8.0)
        .padding(.vertical, 12.0)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color(hex: 0xE3FDEB))
                .shadow(radius: 2.0, x: 0.0, y: 1.0)
        )
    }
}

#Preview {
    ToastView()
}
