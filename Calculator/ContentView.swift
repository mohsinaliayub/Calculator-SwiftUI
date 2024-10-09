//
//  ContentView.swift
//  Calculator
//
//  Created by Mohsin Ali Ayub on 09.10.24.
//

import SwiftUI

struct ContentView: View {
    @State var model = CalculatorViewModel()
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 20) {
                HStack {
                    Spacer()
                    Text(model.output)
                        .font(.largeTitle)
                }
                HStack {
                    Text("RESULT")
                        .lineLimit(1)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
            HStack {
                NumberButton(number: 7)
                NumberButton(number: 8)
                NumberButton(number: 9)
                ActionButton(action: .multiply)
            }
            HStack {
                NumberButton(number: 4)
                NumberButton(number: 5)
                NumberButton(number: 6)
                ActionButton(action: .subtract)
            }
            HStack {
                NumberButton(number: 1)
                NumberButton(number: 2)
                NumberButton(number: 3)
                ActionButton(action: .add)
            }
            HStack {
                ActionButton(action: .sign)
                NumberButton(number: 0)
                ActionButton(action: .clear)
                ActionButton(action: .equal)
            }
        }
        .environment(model)
    }
}

struct NumberButton: View {
    let number: Int
    @Environment(CalculatorViewModel.self) var model
    
    var body: some View {
        Button {
            model.numberTapped(number)
        } label: {
            Text("\(number)")
        }
        .foregroundStyle(.black.opacity(0.8))
        .font(.largeTitle)
        .frame(width: 80, height: 80)
        .background(Circle().fill(.gray.opacity(0.1)))
    }
}

struct ActionButton: View {
    let action: Action
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: action.systemIcon)
        }
        .foregroundStyle(.green)
        .font(.largeTitle)
        .frame(width: 80, height: 80)
        .background(Circle().fill(.gray.opacity(0.1)))
    }
}

enum Action: String {
    case divide
    case multiply
    case subtract = "minus"
    case add = "plus"
    case equal
    case sign = "plus.forwardslash.minus"
    case clear = "C"
    
    var systemIcon: String {
        rawValue
    }
}

#Preview {
    ContentView()
}
