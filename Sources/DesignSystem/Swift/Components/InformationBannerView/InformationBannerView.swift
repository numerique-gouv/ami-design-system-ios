//
//  SwiftUIView.swift
//  ami-design-system-ios
//
//  Created by Nicolas Buquet on 22/06/2026.
//

import SwiftUI

public struct InformationBannerView: View, @MainActor Identifiable {
    private var model: InformationBannerModel

    public var id: UUID { model.id }

    public init(model: InformationBannerModel) {
        self.model = model
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 12) {
                model.icon.swiftUIImage
                    .font(.system(size: 20))
                    .foregroundStyle(model.informationType.foregroundColor)
                    .frame(width: 24, height: 24)

                Text(model.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(model.informationType.foregroundColor)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if model.hasCloseIcon,
                   let onClose = model.onClose {
                    Button {
                        onClose()
                    } label: {
                        AmiDesignSystem.Icons.System.closeLine.swiftUIImage
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(model.informationType.foregroundColor)
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(.plain)
                    .frame(alignment: .trailing)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                if let content = model.content {
                    Text(content)
                        .font(.system(size: 14))
                        .foregroundStyle(model.informationType.foregroundColor.opacity(0.9))
                }

                if let link = model.link,
                   let onClickLink = model.onClickLink {
                    Button {
                        onClickLink()
                    } label: {
                        Text(link)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(model.informationType.foregroundColor)
                            .underline()
                    }
                    .padding(.top, 4)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(model.informationType.backgroundColor)
    }
}

#Preview("Light mode") {
    VStack(spacing: 16) {
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .warning,
            title: "Connexion indisponible",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation",
            onClickLink: { print("Link clicked") },
            onClose: { print("Closed") })
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .information,
            title: "Nouvelle démarche disponible",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation")
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .error,
            title: "Application hors-service",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation",
            onClickLink: { print("Retry clicked") },
            onClose: { print("Closed") })
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .validation,
            title: "Connexion rétablie",
            content: "L'application est de nouveau fonctionnelle.",
            link: "Lien de consultation")
        )
    }
}

#Preview("Dark mode") {
    VStack(spacing: 16) {
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .warning,
            title: "Connexion indisponible",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation",
            onClickLink: { print("Link clicked") },
            onClose: { print("Closed") })
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .information,
            title: "Nouvelle démarche disponible",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation")
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .error,
            title: "Application hors-service",
            content: "Vérifiez votre connexion et réessayez.",
            link: "Lien de consultation",
            onClickLink: { print("Retry clicked") },
            onClose: { print("Closed") })
        )
        InformationBannerView(model: InformationBannerModel(
            id: UUID(),
            informationType: .validation,
            title: "Connexion rétablie",
            content: "L'application est de nouveau fonctionnelle.",
            link: "Lien de consultation")
        )
    }
    .preferredColorScheme(.dark)
}
