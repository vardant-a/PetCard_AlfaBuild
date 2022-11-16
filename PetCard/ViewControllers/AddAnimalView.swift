//
//  AddAnimalView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct AddAnimalView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        VStack {
            NavigationItemsView()
                .padding(.bottom, 50)
            BodyView()
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
    }
    
    // MARK: - Body View
    @ViewBuilder
    private func BodyView() -> some View {
        VStack {
            VStack {
                Text("Face")
            }
            .frame(width: 348.829195, height: 220)
            .background(Color.orange)
            .cornerRadius(14.74)
            .padding(.bottom, 20)
            VStack {
                Text("Back")
            }
            .frame(width: 348.829195, height: 220)
            .background(Color.orange)
            .cornerRadius(14.74)
        }
    }
}

struct AddAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnimalView()
    }
}
