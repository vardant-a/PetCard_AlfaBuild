//
//  AnimalCardView.swift
//  PetCard
//
//  Created by Алексей on 19.11.2022.
//

import SwiftUI

// MARK: - Creating AnimalCardView
struct AnimalCardView: View {
    @State private var faceUp = true
    var body: some View {
        if faceUp {
            FaceAnimalCard()
        } else {
            
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
        func BackAnimalCard() -> some View {

            HStack {
                ReverseButton()
                Spacer()
                
                Text("Back")
                Spacer()
                
                ReverseButton()
            }
            .cardShell()
        }
    }
}

// MARK: - Creating AnimalCard for Adding or Edit Pet
struct AnimalCardForEdit: View {
    
    @Binding var name: String
    
    @State private var faceUp = true
    
    var body: some View {
        
    }
}

struct AnimalCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalCardView()
    }
}


