//
//  CardStackView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct CardStackView: View {
    // состояние кард листа необходимо получать из родительского ViewControllera
    @State private var showingAddAnimalView = false
    @State private var faceUp = true
    
    var body: some View {
        VStack {
            Button(action: {showingAddAnimalView.toggle()}) {
                Text("Adding Animal Card")
            }
            .frame(width: 352, height: 220)
            .background { Color.indigo}
            .cornerRadius(12)
            .sheet(isPresented: $showingAddAnimalView) {
                AddAnimalView()
            }
            if faceUp {
                faceAnimalCard()
            } else {
                BackAnimalCard()
            }
        }
    }
    
    @ViewBuilder
    private func ReverseButton() -> some View {
        Button(action: {faceUp.toggle()}) {
            Text("")
                .frame(width: 12, height: 220)
                .background(.black.opacity(0))
        }
    }
    
    @ViewBuilder
    private func faceAnimalCard() -> some View {
        HStack {
            ReverseButton()
            Spacer()
            ReverseButton()
        }
        .frame(width: 352, height: 220)
        .background { Color.indigo}
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func BackAnimalCard() -> some View {
        HStack {
            ReverseButton()
            Spacer()
            ReverseButton()
        }
        .frame(width: 352, height: 220)
        .background { Color.green}
        .cornerRadius(12)
    }
}

//struct CardStackView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardStackView(animal: User.getUser().animals?.first!)
//    }
//}
