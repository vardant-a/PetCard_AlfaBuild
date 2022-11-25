//
//  StaticAnimalCardView.swift
//  PetCard
//
//  Created by Алексей on 19.11.2022.
//

import SwiftUI

// MARK: - Creating AnimalCardView
struct StaticAnimalCardView: View {
    @State private var animal = Animal.getAnimalList()
    @State private var faceUp = false
    var body: some View {
        if faceUp {
            FaceAnimalCard()
        } else {
            BackAnimalCard()
        }
    }
    
    // MARK: - Face Animal Card
    @ViewBuilder
    private func FaceAnimalCard() -> some View {
        HStack {
            ReverseButton()
            
            VStack() {
                ZStack {
                    Image("avatar")
                        .resizable()
                    Button(action: { print("Tupped") }) {
                        Text("")
                            .frame(width: 100, height: 118.437)
                            .background(.black.opacity(0))
                    }
                }
                .frame(width: 100, height: 118.437)
                .cornerRadius(10)
                .padding(.top)
                Text("Date of Birth")
                    .fontWeight(.bold)
                Text("11.11.11")
            }
            .frame(width: 110)
            .background(.gray)
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                HStack {
                    Text("Name:")
                        .fontWeight(.bold)
                    Text("Ray")
                }
                
                HStack {
                    Text("Class:")
                        .fontWeight(.bold)
                    Text("Dog")
                }
                
                HStack {
                    Text("Breed:")
                        .fontWeight(.bold)
                    
                    Text("Doberman")
                }
                
                HStack {
                    Text("Hair:")
                        .fontWeight(.bold)
                    Text("Black")
                }
                
                HStack {
                    Text("Sex:")
                        .fontWeight(.bold)
                    
                    Text("M")
                }
                Spacer()
            }
            
            Spacer()
            
            VStack {
                CardButtonView()
                    .padding(.top, 15)
                Spacer()
            }
            
            ReverseButton()
        }
        .foregroundColor(.accentColor)
        .cardShell()
    }
    
    // MARK: - Back Animal Card
    @ViewBuilder
    private func BackAnimalCard() -> some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    VStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 5)
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 352, height: 3)
                    }
                    HStack(spacing: 20) {
                        Image(animal.image ?? "a")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .background(Color.green)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Owner name:")
                                    .fontWeight(.bold)
                                Text(animal.ownerName)
                            }
                            VStack(alignment: .leading) {
                                Text("Owner number:")
                                    .fontWeight(.bold)
                                CallButtonView(number: animal.ownerNumber)
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack() {
                        Text("Animal ID:")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text(animal.animalID ?? "nil")
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 352, height: 3)
                        Rectangle()
                            .foregroundColor(.white)
                    }
                    .frame(width: 352)
                    .background(Color.gray)
                }
            }
            HStack {
                ReverseButton()
                    .padding(.leading, 0)
                Spacer()
                ReverseButton()
                    .padding(.trailing, 0)
            }
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

struct StaticAnimalCardView_Previews: PreviewProvider {
    static var previews: some View {
        StaticAnimalCardView()
    }
}


