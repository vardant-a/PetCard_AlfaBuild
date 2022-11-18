//
//  AddAnimalView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct AnimalCard {
    let id = UUID().uuidString
    var name: String
    var image: String
    var animalType: AnimalType
    var breed: String
    var hair: String
    var sex: Sex
    var animalDOB: String
    var faceUp: Bool
    
    static func getAnimalCard() -> AnimalCard {
        return AnimalCard(
            name: "Ray",
            image: "",
            animalType: .dog,
            breed: "Doberman",
            hair: "Black",
            sex: .male,
            animalDOB: "11.11.11",
            faceUp: true
        )
    }
}

enum Sex: String {
    case male = "Male"
    case female = "Female"
}

struct AddAnimalView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var animalCard = AnimalCard.getAnimalCard()

    var body: some View {
        VStack {
            NavigationItemsView()

            AnimalCardView(
                faceUp: $animalCard.faceUp,
                name: $animalCard.name,
                breed: $animalCard.breed,
                sex: animalCard.sex.rawValue,
                dob: $animalCard.animalDOB)
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
            
            Button("Done") {
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
    
    @Binding var name: String
    @Binding var breed: String
    var sex: String
    
    @Binding var dob: String
    var body: some View {
        if faceUp {
            HStack() {
                Button(action: {faceUp.toggle()}) {
                    Text("")
                        .frame(width: 12, height: 220)
                        .background(.black.opacity(0))
                }

                VStack(alignment: .leading) {
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
                        .foregroundColor(.black)
                    TextField("DOB", text: $dob)
                        .foregroundColor(.black)
                        
                }
                .frame(width: 110)
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Name:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        TextField("1", text: $name)
                    }
                        .padding(.top, 30)
                        .foregroundColor(.black)
                    HStack {
                        Text("Breed:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        TextField("2", text: $breed)
                            .foregroundColor(.black)
                    }
                    HStack {
                        Text("Sex:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(sex)
                            .foregroundColor(.black)
                    }
                    Spacer()
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
                    Color.yellow
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
