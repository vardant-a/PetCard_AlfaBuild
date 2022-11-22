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
        if !animalList.isEmpty {
            Button(action: {showingAddAnimalView.toggle()}) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .frame(width: 352, height: 220)
            .background(Color.backgroundColor)
            .cornerRadius(12)
            .sheet(isPresented: $showingAddAnimalView) {
                AddAnimalView()
            }
        } else {
            AnimalCardView()
        }
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(animalList: [])
    }
}
