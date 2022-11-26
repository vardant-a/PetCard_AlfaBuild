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
    var animal = Animal.getAnimalList()
    
    var body: some View {
        if !animalList.isEmpty {
            VStack {
                Spacer()
                Image("AnimalListIsEmpty")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 218.7)
                VStack {
                    Text("Your pet list is empty.")
                        .fontWeight(.bold)
                    Text("Add a pet to see the animal card.")
                        .fontWeight(.bold)
                }
                .font(.title2)
                
                Spacer()
                AddAnimalCardButton()
                    .padding(.horizontal)
                    .padding(.bottom, 23)
            }
        } else {
            StaticAnimalCardView(animal: animal)
        }
    }
    
    @ViewBuilder
    private func AddAnimalCardButton() -> some View {
        Button(action: { showingAddAnimalView.toggle() }) {
            Text("Add animal")
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
