//
//  InformationBannerModel.swift
//  ami-design-system-ios
//
//  Created by Nicolas Buquet on 22/06/2026.
//

import Foundation

public struct InformationBannerModel: Identifiable {
    public typealias LinkAction = () -> Void
    public typealias CloseAction = () -> Void

    public let id: UUID
    let informationType: InformationBannerType
    let title: String
    let icon: DsfrImageAsset
    let content: String?
    let link: String?
    let onClickLink: LinkAction?
    let onClose: CloseAction?

    var hasCloseIcon: Bool {
        onClose != nil
    }

    public init(id: UUID,
                informationType: InformationBannerType,
                title: String,
                icon: DsfrImageAsset? = nil,
                content: String? = nil,
                link: String? = nil,
                onClickLink: LinkAction? = nil,
                onClose: CloseAction? = nil) {
        self.id = id
        self.informationType = informationType
        self.title = title
        self.icon = icon ?? informationType.defaultIcon
        self.content = content
        self.link = link
        self.onClickLink = onClickLink
        self.onClose = onClose
    }
}
