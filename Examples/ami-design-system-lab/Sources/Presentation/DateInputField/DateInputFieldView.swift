//
//  DateInputFieldView.swift
//  Ami-lab-Production
//
//  Created by Nicolas Buquet on 12/03/2026.
//  Copyright © 2026 DINUM. All rights reserved.
//

import SwiftUI

struct DateInputFieldView<T: DatePickerStyle>: View {
    let label: String
    var bindedDate: Binding<Date?>
    var datePickerStyle: T

    // Internal use to display selected date
    @State private var internalDate: Date
    @State private var dateAsText = ""

    // Internal use to scale DatePicker to fill the component
    // to be activated by tap on any part of the component.
    @State private var datePickerNativeSize = CGSize.zero
    @State private var datePickerScaleValue = CGSize(width: 1.0, height: 1.0)

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()

    private func updateDateAsText(with date: Date) {
        dateAsText = dateFormatter.string(from: date)
    }

    init(label: String, bindedDate: Binding<Date?>, datePickerStyle: T = .automatic) {
        self.label = label
        self.bindedDate = bindedDate
        // Init internal date to .now if no value provided.
        // Only a new picked value will be copied to binded date.
        internalDate = bindedDate.wrappedValue ?? .now
        self.datePickerStyle = datePickerStyle
    }

    var body: some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 8.0) {
                // The label at tstart of component.
                Text(label)
                    .font(.subheadline)

                Spacer()

                // The selected date representation at end of componenet.
                Text(dateAsText)
                    .font(.subheadline)

                // The calendar icon after the date representation.
                Image(systemName: "calendar")
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 6.0)
            .frame(maxWidth: .infinity, minHeight: 56.0)
            .background(Color(hex: 0xEDEDED))
            Color(hex: 0x3A3A3A)
                .frame(height: 2.0)
        }
        .measureSize { size in
            // step 2: get component size and calculate datePicker scale value.
            datePickerScaleValue = CGSize(width: size.width / datePickerNativeSize.width,
                                          height: size.height / datePickerNativeSize.height)
        }
        // Set the view unreactive to tap with `allowHitTesting(false)`.
        .allowsHitTesting(false)
        // Put the DatePicker in background to be hidden by the view.
        // Align DatePicker to trailing to be under the calendar icon.
        .overlay(alignment: .trailing) {
            DatePicker("", selection: $internalDate, displayedComponents: .date)
                .datePickerStyle(datePickerStyle)
                .labelsHidden()
                // Use `colorMultiply` rather than opacity(0.0) to let the DatePicker reactive to tap.
                .colorMultiply(.clear)
                .measureSize { size in
                    // step 1: get DatePicker native size.
                    datePickerNativeSize = size
                }
                .scaleEffect(datePickerScaleValue, anchor: UnitPoint(x: 1.0, y: 0.5))
        }
        .onChange(of: internalDate) { newDate in
            updateDateAsText(with: newDate)
            // Propagate change to binding.
            bindedDate.wrappedValue = newDate
        }
    }
}

#Preview {
    var _content: Date? = Date()
    let binding = Binding {
        _content
    } set: { newValue in
        _content = newValue
    }

    VStack {
        DateInputFieldView(label: "Date de début",
                           bindedDate: binding,
                           datePickerStyle: .compact)
            .padding()
    }
    .frame(maxHeight: .infinity)
    .background(
        Color(hex: 0xAAAAAA)
    )
}
