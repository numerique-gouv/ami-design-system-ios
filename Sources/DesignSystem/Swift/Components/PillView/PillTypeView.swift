//
//  PillTypeView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 05/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct PillTypeView: View {
    let label: String
    let iconName: String
    let foregroundColor: Color
    let backgroundColor: Color

    var body: some View {
        HStack(spacing: 4.5) {
            Image(systemName: iconName)
            Text(label.uppercased())
                .bold()
        }
        .font(.caption)
        .bold()
        .foregroundStyle(foregroundColor)
        .padding(EdgeInsets(top: 4.0, leading: 6.0, bottom: 3.0, trailing: 6.0))
        .background(
            RoundedRectangle(cornerRadius: 4.0)
                .fill(backgroundColor)
        )
    }
}

#Preview {
    PillTypeView(label: "consommation",
             iconName: "cart",
             foregroundColor: .black,
             backgroundColor: .orange)
}
