//
//  StartView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct StartView: View {
    private let viewModel: StartViewModel

    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Start")
            .font(.title)
            .bold()
        List(viewModel.items) { item in
            ItemView(viewModel: viewModel, item: item)
        }
    }
}

struct ItemView: View {
    let viewModel: StartViewModel
    let item: StartViewModel.Item

    var body: some View {
        Button {
            viewModel.processAction?(item.action)
        } label: {
            Text(item.title)
        }
    }
}

#Preview {
    let viewModel = StartViewModel()
//    viewModel.processAction = { action in
//        switch action {
//        case .start:
//            print("Start pressed!")
//        }
//    }
    StartView(viewModel: viewModel)
}
