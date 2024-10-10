//
//  ContentView.swift
//  Calculator
//
//  Created by Mohsin Ali Ayub on 09.10.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            display
            NumberPad()
        }
        .padding()
        .padding(.vertical, 24)
    }
    
    var display: some View {
        VStack(spacing: 5) {
            HStack {
                Spacer()
                Text("38,670 - 14,000")
                    .font(.system(size: 28))
                    .foregroundStyle(.secondary)
            }
            HStack {
                Spacer()
                Text("24,670")
                    .font(.system(size: 64))
            }
        }
        .padding()
    }
}

struct NumberPad: View {
    var body: some View {
        VStack {
            HStack {
                ActionButton(action: .delete)
                ActionButton(action: .sign)
                ActionButton(action: .percent)
                OperationButton(operation: .division)
            }
            HStack {
                CircleButton(label: "7")
                CircleButton(label: "8")
                CircleButton(label: "9")
                OperationButton(operation: .multiplication)
            }
            HStack {
                CircleButton(label: "4")
                CircleButton(label: "5")
                CircleButton(label: "6")
                OperationButton(operation: .subtraction)
            }
            HStack {
                CircleButton(label: "1")
                CircleButton(label: "2")
                CircleButton(label: "3")
                OperationButton(operation: .addition)
            }
            HStack {
                ActionButton(action: .clear)
                CircleButton(label: "0")
                CircleButton(label: ".")
                OperationButton(operation: .equal)
            }
        }
    }
}

struct CircleButton: View {
    let label: String
    
    var body: some View {
        Button(label) {
            
        }
        .font(.largeTitle)
        .foregroundStyle(.primary)
        .frame(width: 90, height: 90)
        .background(Circle().fill(.secondary.opacity(0.3)))
    }
}

struct OperationButton: View {
    let operation: Operation
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: operation.icon)
        }
        .font(.largeTitle)
        .foregroundStyle(.primary)
        .frame(width: 90, height: 90)
        .background(Circle().fill(.green.opacity(0.65)))
    }
}

struct ActionButton: View {
    let action: Action
    
    var body: some View {
        Button {
            
        } label: {
            if let icon = action.icon {
                Image(systemName: icon)
            } else {
                Text(action.rawValue)
            }
        }
        .font(.largeTitle)
        .foregroundStyle(.primary)
        .frame(width: 90, height: 90)
        .background(Circle().fill(.secondary.opacity(0.65)))
    }
}

extension Operation {
    var icon: String {
        switch self {
        case .division:
            return "divide"
        case .multiplication:
            return "multiply"
        case .subtraction:
            return "minus"
        case .addition:
            return "plus"
        case .equal:
            return "equal"
        @unknown default: 
            return ""
        }
    }
}

enum Action: String {
    case clear = "C"
    case sign
    case percent
    case delete
    
    var icon: String? {
        switch self {
        case .clear:
            return nil
        case .sign:
            return "plus.forwardslash.minus"
        case .percent:
            return "percent"
        case .delete:
            return "delete.backward"
        }
    }
}

#Preview {
    ContentView()
}
