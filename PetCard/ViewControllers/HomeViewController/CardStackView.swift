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
    
    var animalList: [Animal]
    @State private var animal = Animal.getAnimalList()
    
    var body: some View {
        if animalList.isEmpty {
            VStack {
                Spacer()
                Image("")
                Text("Animal List is Empty")
                Spacer()
                AddFirstAnimalCardButton()
                    .padding(.horizontal)
                    .padding(.bottom, 23)
            }
        } else {
            StaticAnimalCardView()
        }
    }
    
    @ViewBuilder
    private func AddFirstAnimalCardButton() -> some View {
        Button(action: { showingAddAnimalView.toggle() }) {
            Text("Add first Animal")
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color.barColor)
                .cornerRadius(8)
        }
        .sheet(isPresented: $showingAddAnimalView) {
            AddAnimalView()
        }
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(animalList: [])
    }
}
