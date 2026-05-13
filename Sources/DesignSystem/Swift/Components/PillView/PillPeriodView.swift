//
//  PillPeriodView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 05/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

public struct PillPeriodView: View {
    let text: String
    let foregroundColor: Color
    let backgroundColor: Color

    public var body: some View {
        Text(text)
            .font(.caption)
            .foregroundStyle(foregroundColor)
            .padding(EdgeInsets(top: 4.0, leading: 8.0, bottom: 4.0, trailing: 8.0))
            .background(
                Capsule()
                    .fill(backgroundColor)
            )
    }
}

#Preview {
    PillPeriodView(text: "Du 20 décembre au 5 janvier 2006",
               foregroundColor: .black,
               backgroundColor: .green)
}
