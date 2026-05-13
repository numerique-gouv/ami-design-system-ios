//
//  TileView.swift
//  AMI-Design-System
//
//  Created by Nicolas Buquet on 13/05/2026.
//

import SwiftUI

public struct TileView: View {
    @State var title: String
    @State var content: String

    public var body: some View {
        VStack {
            Group {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(DsfrFont.h4.font)
                        .foregroundStyle(AmiDesignSystem.Colors.Artwork.Major.blueFrance.swiftUIColor)
                    Text(content)
                        .font(DsfrFont.textSM.font)
                    HStack {
                        AmiDesignSystem.Icons.Arrows.arrowRightSLine.swiftUIImage
                            .foregroundStyle(AmiDesignSystem.Colors.Artwork.Major.blueFrance.swiftUIColor)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 2.0, trailing: 16.0))
            }
            AmiDesignSystem.Colors.Border.Default.blueFrance.swiftUIColor
                .frame(height: 8.0)
        }
        .border(AmiDesignSystem.Colors.Border.Default.blueFrance.swiftUIColor, width: 1.0)
        .padding(16)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            ForEach(0..<10) { i in
                TileView(title: "Tile #\(i)", content: "Tile content\nrunning on 2 lines")
            }
            .navigationTitle("Tile example")
        }
    }
}
