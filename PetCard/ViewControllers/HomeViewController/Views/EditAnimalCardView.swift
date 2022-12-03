//
//  EditAnimalCardView.swift
//  PetCard
//
//  Created by Алексей on 20.11.2022.
//

import SwiftUI

struct EditAnimalCardView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var animal: Animal = Animal.getAnimalList()
    @State private var name = ""
    @State private var animalType: AnimalType = .notDefined
    @State private var breed = ""
    @State private var hair = ""
    @State private var sex: Sex = .notDefined
    @State private var dob = ""
    
    var body: some View {
        VStack {
            NavigationItemsView()
            
            DinamicAnimalCardView(animal: $animal)
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
                print("Done Edit")
                // Добавить сохранение в базу данных питомца к пользователю
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 50)
    }
}

struct EditAnimalCardView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView(animalList: [])
    }
}
