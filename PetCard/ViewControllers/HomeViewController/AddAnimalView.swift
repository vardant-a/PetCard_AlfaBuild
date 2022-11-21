//
//  AddAnimalView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct AddAnimalView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>

    @State private var animalName = ""
    @State private var animalType = ""
    @State private var sex: Sex = .male
    
    var body: some View {
        VStack {
            NavigationItemsView()
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
                saveAnimalCard()
                // Добавить сохранение в базу данных питомца к пользователю
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 50)
    }
    
    private func saveAnimalCard() {
        print("Done")
    }
}

struct AddAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnimalView()
    }
}
