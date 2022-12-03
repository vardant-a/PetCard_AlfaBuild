//
//  DinamicAnimalCardView.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import SwiftUI

// MARK: - Creating AnimalCard for Adding or Edit Pet
struct DinamicAnimalCardView: View {

    // MARK: - Binding properties
    
    @Binding var animal: Animal
    
//    @Binding var name: String
//    @Binding var animalType: AnimalType
//    @Binding var breed: String
//    @Binding var hair: String
//    @Binding var sex: Sex
//    @Binding var dob: String
    
    @State private var faceUp = true
    
    var body: some View {
        if faceUp {
            FaceAnimalCard()
        } else {
            BackAnimalCard()
        }
    }
    
    // MARK: - Face AnimalCard
    @ViewBuilder
    private func FaceAnimalCard() -> some View {
        HStack {
            ReverseButton()
            VStack {
                HStack {
                    Text("Name:")
                    TextField("name", text: $animal.name)
                }
            }
            ReverseButton()
        }
        .cardShell()
    }
    
    // MARK: - Back AnimalCard
    @ViewBuilder
    private func BackAnimalCard() -> some View {
        HStack {
            ReverseButton()
            Spacer()
            
            Text("Back")
            Spacer()
            
            ReverseButton()
        }
        .cardShell()
    }
    
    // MARK: - Button for reverse AnimalCard
    @ViewBuilder
    private func ReverseButton() -> some View {
        Button(action: {faceUp.toggle()}) {
            Text("")
                .frame(width: 12, height: 220)
                .background(.black.opacity(0.05))
        }
    }
}

struct DinamicAnimalCardView_Previews: PreviewProvider {
    static var previews: some View {
        DinamicAnimalCardView(animal: .constant(Animal.getAnimalList()))
    }
}
