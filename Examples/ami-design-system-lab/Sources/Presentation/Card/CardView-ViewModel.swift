//
//  CardView-ViewModel.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 05/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import Foundation
import SwiftUI

extension CardView {
    class ViewModel: ObservableObject {
        enum CardType {
            case consommation
            case logement
            case vacances
            case jourFerie

            var label: String {
                switch self {
                case .consommation: "consommation"
                case .logement: "logement"
                case .vacances: "vacances"
                case .jourFerie: "jour férié"
                }
            }

            var iconName: String {
                switch self {
                case .consommation: "cart"
                case .logement: "house.fill"
                case .vacances: "calendar"
                case .jourFerie: "calendar"
                }
            }

            var foregroundColor: Color {
                switch self {
                case .consommation: Color(hex: 0x6E445A)
                case .logement: Color(hex: 0x006A6F)
                case .vacances: Color(hex: 0x000091)
                case .jourFerie: Color(hex: 0x000091)
                }
            }

            var backgroundColor: Color {
                switch self {
                case .consommation: Color(hex: 0xF4E3C7)
                case .logement: Color(hex: 0xE5FBFD)
                case .vacances: Color(hex: 0xE3E3FD)
                case .jourFerie: Color(hex: 0xE3E3FD)
                }
            }
        }

        enum CardPeriod {
            case from(Date)
            case fromTo(Date, Date)

            var text: String {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none

                switch self {
                case let .from(date): return "À partir du \(dateFormatter.string(from: date))"
                case let .fromTo(dateFrom, dateTo): return "Du \(dateFormatter.string(from: dateFrom)) au \(dateFormatter.string(from: dateTo)))"
                }
            }
        }

        let date: Date
        let type: CardType
        let period: CardPeriod
        let title: String
        let description: String?
        @Published var isSelected = false

        init(date: Date, type: CardType, period: CardPeriod, title: String, description: String? = nil) {
            self.date = date
            self.type = type
            self.period = period
            self.title = title
            self.description = description
        }

        var dateWeekday: String {
            DateFormatter().shortWeekdaySymbols[Calendar.current.component(.weekday, from: date) - 1]
        }

        var dateDay: Int {
            Calendar.current.component(.day, from: date)
        }
    }
}

extension CardView.ViewModel: Identifiable {}
