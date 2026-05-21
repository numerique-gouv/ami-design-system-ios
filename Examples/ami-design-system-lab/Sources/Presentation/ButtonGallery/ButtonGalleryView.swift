//
//  ButtonGalleryView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import AmiDesignSystem
import SwiftUI

struct ButtonGalleryView: View {
    @ObservedObject private var viewModel: ButtonGalleryViewModel

    @State private var showDatePickerDateFrom = false

    init(viewModel: ButtonGalleryViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private var primaryButton: some View {
        Button {
            viewModel.processAction?(.primaryAction)
        } label: {
            Text("Continuer")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .primary))
    }

    @ViewBuilder
    private var secondaryButton: some View {
        Button {
            viewModel.processAction?(.secondaryAction)
        } label: {
            Text("Annuler")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .secondary))
    }

    @ViewBuilder
    private var primaryDisabledButton: some View {
        Button {
            viewModel.processAction?(.primaryAction)
        } label: {
            Text("Continuer")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .primary))
        .disabled(true)
    }

    @ViewBuilder
    private var smallButton01: some View {
        Button {
            viewModel.processAction?(.primaryAction)
        } label: {
            Text("Small #1")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .primary))
    }

    @ViewBuilder
    private var smallButton02: some View {
        Button {
            viewModel.processAction?(.secondaryAction)
        } label: {
            Text("Small #2")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(ButtonStyleDsfr(type: .secondary))
    }

    var body: some View {
        VStack(spacing: 16.0) {
            primaryButton
            secondaryButton
            primaryDisabledButton
            HStack(spacing: 8.0) {
                smallButton01
                    .fixedSize()
                smallButton02
                    .fixedSize()
                Spacer()
            }
        }
        .padding(.horizontal, 32.0)
        .navigationTitle("Button Gallery")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ButtonGalleryView(viewModel: ButtonGalleryViewModel())
}
