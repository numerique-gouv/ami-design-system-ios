//
//  FontGalleryView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

struct FontGalleryView: View {
    private var viewModel: FontGalleryViewModel

    init(viewModel: FontGalleryViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.items, id: \.typeLabel) { fontItem in
            VStack(alignment: .leading, spacing: 16.0) {
                Text(fontItem.typeLabel)
                    .dsfrFont(fontItem.font)
                    .bold()
                    .padding(.horizontal, 12.0)
                    .padding(.vertical, 6.0)
                    .background(
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(AmiDesignSystem.Colors.Background.Open.blueFrance.swiftUIColor)
                    )
                Text(fontItem.text)
                    .dsfrFont(fontItem.font)
            }
        }
        .navigationTitle("DSFR Font Gallery")
    }
}

#Preview {
    FontGalleryView(viewModel: FontGalleryViewModel())
}
