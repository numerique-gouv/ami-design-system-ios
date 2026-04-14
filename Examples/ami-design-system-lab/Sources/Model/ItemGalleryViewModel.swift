//
//  ItemGalleryViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 31/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

protocol Nameable {
    var name: String { get }
}

final class ItemGalleryViewModel<T: Nameable>: ObservableObject {
    struct ItemSection {
        var fullname: String
        var subSections: [String: ItemSection]
        var items: [String: T]
        var hierarchicalLevel: Int

        mutating func addItem(itemName: String, item: T) {
            let itemNamePart = itemName.split(separator: "/", maxSplits: 1)
            if itemNamePart.count == 1 {
                items[String(itemNamePart.first!)] = item
            } else {
                let itemNamePrefix = String(itemNamePart.first!)
                var insertSection = subSections[itemNamePrefix] ?? ItemSection(fullname: "\(fullname)/\(itemNamePrefix)",
                                                                               subSections: [:],
                                                                               items: [:],
                                                                               hierarchicalLevel: hierarchicalLevel + 1)
                insertSection.addItem(itemName: String(itemNamePart.last!), item: item)
                subSections[itemNamePrefix] = insertSection
            }
        }
    }

    let hierarchicalItemList: ItemSection

    private static func explode(inputList: [String: T]) -> ItemSection {
        var result = ItemSection(fullname: "", subSections: [:], items: [:], hierarchicalLevel: 0)
        for (name, color) in inputList {
            result.addItem(itemName: name, item: color)
        }
        return result
    }

    @Published var sectionIsExpanded: Set<String> = []

    private func initSectionExpandedStates(from section: ItemSection) {
        sectionIsExpanded.insert("")
    }

    init(flatItemList: [T]) {
        hierarchicalItemList = Self.explode(inputList: flatItemList.reduce([String: T]()) { partialResult, colorAsset in
            var returnResult = partialResult
            returnResult[colorAsset.name] = colorAsset
            return returnResult
        })
        initSectionExpandedStates(from: hierarchicalItemList)
    }

    func toggleSection(fullname: String) {
        if sectionIsExpanded.contains(fullname) {
            sectionIsExpanded.remove(fullname)
        } else {
            sectionIsExpanded.insert(fullname)
        }
    }
}
