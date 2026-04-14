//
//  ColorGalleryView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 27/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

typealias ColorGalleryViewModel = ItemGalleryViewModel<DsfrColorAsset>

struct ColorGalleryView: View {
    @ObservedObject private var viewModel: ColorGalleryViewModel

    init(viewModel: ColorGalleryViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ColorSectionView(name: "",
                             fullname: viewModel.hierarchicalItemList.fullname,
                             level: viewModel.hierarchicalItemList.hierarchicalLevel,
                             items: viewModel.hierarchicalItemList.items,
                             subSections: viewModel.hierarchicalItemList.subSections,
                             viewModel: viewModel,
                             hideSectionHeader: true)
        }
        .listStyle(.sidebar)
        .navigationTitle("DSFR Color Gallery")
    }
}

struct ColorSectionView: View {
    let name: String
    let fullname: String
    let level: Int
    let items: [String: DsfrColorAsset]
    let subSections: [String: ColorGalleryViewModel.ItemSection]
    let viewModel: ColorGalleryViewModel
    var sectionIsExpanded: Binding<Bool>
    var hideSectionHeader: Bool // to be able to hide the root section state.

    init(name: String,
         fullname: String,
         level: Int,
         items: [String: DsfrColorAsset],
         subSections: [String: ColorGalleryViewModel.ItemSection],
         viewModel: ColorGalleryViewModel,
         hideSectionHeader: Bool = false) {
        self.name = name
        self.fullname = fullname
        self.level = level
        self.items = items
        self.subSections = subSections
        self.viewModel = viewModel
        self.hideSectionHeader = hideSectionHeader
        sectionIsExpanded = Binding<Bool>(
            get: { viewModel.sectionIsExpanded.contains(fullname) },
            set: { _ in viewModel.toggleSection(fullname: fullname) }
        )
    }

    @ViewBuilder
    private var itemContent: some View {
        if items.count > 0 {
            ForEach(items.keys.sorted(), id: \.self) { key in
                ColorItemView(item: items[key]!)
            }
        }
    }

    @ViewBuilder
    private var subSectionsContent: some View {
        if subSections.count > 0 {
            ForEach(subSections.keys.sorted(), id: \.self) { key in
                ColorSectionView(name: key,
                                 fullname: subSections[key]!.fullname,
                                 level: subSections[key]!.hierarchicalLevel,
                                 items: subSections[key]!.items,
                                 subSections: subSections[key]!.subSections,
                                 viewModel: viewModel)
            }
        }
    }

    var body: some View {
        Section(isExpanded: sectionIsExpanded) {
            itemContent
            subSectionsContent
        } header: {
            if hideSectionHeader {
                EmptyView()
            } else {
                Text(name)
                    .padding(.leading, 16.0 * CGFloat(level - 1))
            }
        }
    }
}

struct ColorItemView: View {
    let item: DsfrColorAsset

    var body: some View {
        HStack(spacing: 16.0) {
            item.swiftUIColor
                .environment(\.colorScheme, .light)
                .frame(width: 48.0, height: 48.0)
            item.swiftUIColor
                .environment(\.colorScheme, .dark)
                .frame(width: 48.0, height: 48.0)
            Text(item.name.split(separator: "/").last!)
                .font(.callout)
        }
    }
}

#Preview {
    ColorGalleryView(viewModel: ColorGalleryViewModel(flatItemList: AmiDesignSystem.Colors.allColors))
}
