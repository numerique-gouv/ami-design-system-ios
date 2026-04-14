//
//  AgendaView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct AgendaView: View {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(viewModel.items) { item in
                    Button {
                        if let action = item.action {
                            viewModel.processAction?(action)
                        }
                    } label: {
                        CardView(viewModel: item.card)
                            .frame(maxWidth: .infinity)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.removeItem(item)
                        } label: {
                            Image(systemName: "trash")
                                .tint(Color(hex: 0xFFE9E9)) // background
                                .foregroundStyle(Color(hex: 0xCE0500), .clear) // foreground (2nd color parameter needed!)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .listRowSpacing(16.0)
            .padding()

            ToastView()
                .padding(.horizontal, 8.0)
                .offset(CGSize(width: 0.0, height: -12.0))
                .opacity(viewModel.showConfirmationToast ? 1.0 : 0.0)
        }
        .navigationTitle("Mon agenda")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AgendaView(viewModel: AgendaCoordinator.sampleViewModel())
    }
}
