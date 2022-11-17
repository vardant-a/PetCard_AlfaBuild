//
//  AddAnimalView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct AddAnimalView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var faceUp = true
    @State private var animalName = ""
    @State private var animalDOB = ""
    var body: some View {
        VStack {
            NavigationItemsView()

            AnimalCardView(
                faceUp: $faceUp,
                animalName: $animalName,
                animalDOB: $animalDOB)
            Spacer()
        }
    }
    
    // MARK: - Header View
    @ViewBuilder
    private func NavigationItemsView() -> some View {
        HStack {
            Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
            
            Button("Save") {
                print("Save")
                // Добавить сохранение в базу данных питомца к пользователю
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 50)
    }
}

struct AddAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnimalView()
    }
}

struct AnimalCardView: View {
    @Binding var faceUp: Bool
    @Binding var animalName: String
    @Binding var animalDOB: String
    var body: some View {
        if faceUp {
            HStack {
                Button(action: {faceUp.toggle()}) {
                    Text("")
                        .frame(width: 12, height: 220)
                        .background(.black.opacity(0))
                }
                VStack(alignment: .leading) {
                    Image("avatar")
                        .resizable()
                        .frame(width: 100, height: 118.437)
                        .padding(.top)
                    Text("Date of Birth")
                    TextField("DOB", text: $animalDOB)
                }
                
                Spacer()
                Button(action: {faceUp.toggle()}) {
                    Text("")
                        .frame(width: 12, height: 220)
                        .background(.black.opacity(0))
                }
            }
            .frame(width: 352, height: 220)
            .background {
                Image(systemName: "person")
                    .resizable()
                    Color.indigo
            }
            .cornerRadius(12)
            .padding(.bottom, 20)
        } else {
            VStack {
                HStack {
                    Button(action: {faceUp.toggle()}) {
                        Text("")
                            .frame(width: 12, height: 220)
                            .background(.black.opacity(0))
                    }
                    Spacer()
                    Button(action: {faceUp.toggle()}) {
                        Text("")
                            .frame(width: 12, height: 220)
                            .background(.black.opacity(0))
                    }
                }
                
            }
            .frame(width: 352, height: 220)
            .background(Color.gray)
            .cornerRadius(12)
            .padding(.bottom, 20)
        }
    }
}
