//
//  IconGalleryView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 31/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

typealias IconGalleryViewModel = ItemGalleryViewModel<DsfrImageAsset>

struct IconGalleryView: View {
    @ObservedObject private var viewModel: IconGalleryViewModel

    init(viewModel: IconGalleryViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            IconSectionView(name: "",
                            fullname: viewModel.hierarchicalItemList.fullname,
                            level: viewModel.hierarchicalItemList.hierarchicalLevel,
                            items: viewModel.hierarchicalItemList.items,
                            subSections: viewModel.hierarchicalItemList.subSections,
                            viewModel: viewModel,
                            hideSectionHeader: true)
        }
        .listStyle(.sidebar)
        .navigationTitle("DSFR Icon Gallery")
    }
}

struct IconSectionView: View {
    let name: String
    let fullname: String
    let level: Int
    let items: [String: DsfrImageAsset]
    let subSections: [String: IconGalleryViewModel.ItemSection]
    let viewModel: IconGalleryViewModel
    var sectionIsExpanded: Binding<Bool>
    var hideSectionHeader: Bool // to be able to hide the root section state.

    init(name: String,
         fullname: String,
         level: Int,
         items: [String: DsfrImageAsset],
         subSections: [String: IconGalleryViewModel.ItemSection],
         viewModel: IconGalleryViewModel,
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
                IconItemView(item: items[key]!)
            }
        }
    }

    @ViewBuilder
    private var subSectionsContent: some View {
        if subSections.count > 0 {
            ForEach(subSections.keys.sorted(), id: \.self) { key in
                IconSectionView(name: key,
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

struct IconItemView: View {
    let item: DsfrImageAsset

    var body: some View {
        HStack(spacing: 16.0) {
            item.swiftUIImage
                .resizable()
                .frame(width: 32.0, height: 32.0)
            Text(item.name.split(separator: "/").last!)
                .font(.callout)
        }
    }
}

#Preview {
    IconGalleryView(viewModel: IconGalleryViewModel(flatItemList: AmiDesignSystem.Icons.allImages))
}
