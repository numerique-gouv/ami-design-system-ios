//
//  Router.swift
//  AMI-lab-xcodegen
//
//  Created by Nicolas Buquet on 06/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation

final class Router: ObservableObject {
    @Published var rootCoordinator: AnyCoordinator
    @Published var useNavigationStack = true
    @Published var path = [AnyCoordinator]()
    @Published var presentedSheet: AnyCoordinator?
    @Published var fullScreenCover: AnyCoordinator?

//    @Published var tabBarVisibility: Visibility [
//        if !useNavigationStack {
//            return .visible
//        } else {
//            return path.count
//        }
//    ]

    init(rootCoordinator: AnyCoordinator, useNavigationStack: Bool = true) {
        self.rootCoordinator = rootCoordinator
        self.useNavigationStack = useNavigationStack

//        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
//            if self.useNavigationStack {
//                print("Root: \(self.rootCoordinator) - Path: \(self.path)")
//            } else {
//                print("Root: \(self.rootCoordinator)")
//            }
//        }
    }

    func setRoot(coordinator: AnyCoordinator, useNavigationStack: Bool? = nil) {
        if self.useNavigationStack {
            popToRoot()
        }

        rootCoordinator = coordinator

        if let useNavigationStack {
            self.useNavigationStack = useNavigationStack
        }
    }

    func push(coordinator: AnyCoordinator) {
        guard useNavigationStack,
              coordinator != rootCoordinator else {
            fatalError("Trying to push coordinator \(String(describing: coordinator))")
        }
        path.append(coordinator)
    }

    func pop() {
        guard useNavigationStack else {
            fatalError("Trying to pop coordinator not using a NavigationStck.")
        }
        guard useNavigationStack else {
            fatalError("Trying to pop coordinator not using a NavigationStck.")
        }
        path.removeLast()
    }

    func popTo<T>(coordinatorType: T.Type) {
        guard useNavigationStack else {
            fatalError("Trying to pop coordinator not using a NavigationStck.")
        }
        guard let index = path.lastIndex(where: { $0 is T }) else {
            popToRoot()
            return
        }
        path.removeSubrange(index + 1 ..< path.count)
    }

    func popToRoot() {
        guard useNavigationStack else {
            fatalError("Trying to pop coordinator not using a NavigationStck.")
        }
        path.removeAll()
    }

    func presentSheet(coordinator: AnyCoordinator?) {
        presentedSheet = coordinator
    }

    func presentFullscreen(coordinator: AnyCoordinator?) {
        fullScreenCover = coordinator
    }
}
