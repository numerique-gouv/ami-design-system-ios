//
//  FormPart02View.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct FormPart02View: View {
    @ObservedObject private var viewModel: FormPart02ViewModel

    @State private var showDatePickerDateFrom = false

    init(viewModel: FormPart02ViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder
    private var progress: some View {
        HStack(spacing: 0.0) {
            LinearProgressView(value: 1.0)
                .frame(height: 6.0)
                .padding(.trailing, 8.0)
            Text("2/2")
        }
    }

    @ViewBuilder
    private var title: some View {
        Text("Votre accès")
            .font(.title)
            .bold()
    }

    @ViewBuilder
    private var item01: some View {
        HStack(spacing: 0.0) {
            Text("L’accès à votre logement est-il contrôlé par un badge VIGIK® ?")
            Spacer(minLength: 16.0)
            Toggle(isOn: $viewModel.item01) {}
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // needed for Toggle widget.
        }
    }

    @ViewBuilder
    private var item02: some View {
        HStack(spacing: 0.0) {
            Text("Votre logement est-il équipé d’une alarme ?")
            Spacer(minLength: 16.0)
            Toggle(isOn: $viewModel.item02) {}
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // needed for Toggle widget.
        }
    }

    @ViewBuilder
    private var item03: some View {
        HStack(spacing: 0.0) {
            Text("Votre logement est-il relié à un service de télésurveillance ?")
            Spacer(minLength: 16.0)
            Toggle(isOn: $viewModel.item03) {}
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // needed for Toggle widget.
        }
    }

    @ViewBuilder
    private var item04: some View {
        HStack(spacing: 0.0) {
            Text("L’accès à votre logement est-il contrôlé par un ou plusieurs codes d’accès ?")
            Spacer(minLength: 16.0)
            Toggle(isOn: $viewModel.item04) {}
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // needed for Toggle widget.
        }
    }

    @ViewBuilder
    private var previousButton: some View {
        Button {
            viewModel.processAction?(.previous)
        } label: {
            Text("Précédent")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(DsfrButtonStyle(type: .secondary))
    }

    @ViewBuilder
    private var continueButton: some View {
        Button {
            viewModel.processAction?(.validate)
        } label: {
            Text("Continuer")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(DsfrButtonStyle(type: .primary))
    }

    var body: some View {
        progress
            .padding()

        ScrollView {
            VStack(alignment: .leading, spacing: 0.0) {
                title
                    .padding(.bottom, 16.0)

                item01
                    .padding(.vertical, 24.0)
                item02
                    .padding(.vertical, 24.0)
                item03
                    .padding(.vertical, 24.0)
                item04
                    .padding(.vertical, 24.0)

                Spacer(minLength: 54.0)

                HStack(spacing: 16.0) {
                    previousButton
                    continueButton
                }
            }
            //            .formStyle(.columns)
            .listStyle(.plain)
            .padding(.horizontal, 16.0)
        }
        .navigationTitle("Opération tranquilité vacances")
        .fullScreenCover(isPresented: $viewModel.showAlert) {
            ZStack {
                AlertView(viewModel: viewModel.alertViewModel)
            }
            .presentationBackground(.ultraThinMaterial)
        }
    }
}

#Preview {
    FormPart02View(viewModel: FormPart02ViewModel())
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .dark

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
