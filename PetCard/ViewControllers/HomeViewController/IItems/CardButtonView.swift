//
//  CardButtonView.swift
//  PetCard
//
//  Created by Алексей on 20.11.2022.
//

import SwiftUI

struct CardButtonView: View {
    
    @State private var isShowAlertDialog = false
    @State private var isShowAddView = false
    @State private var isShowEditView = false

    var body: some View {
        Button(action: {
            isShowAlertDialog.toggle()
        }) {
            Image(systemName: "slider.horizontal.3")
        }
        .confirmationDialog("Pay", isPresented: $isShowAlertDialog) {
            
            // MARK: - Create AnimalCard
            Button("Add Animal") {
                isShowAddView.toggle()
            }
            
            // MARK: - Edit AnimalCard
            Button("Edit") {
                isShowEditView.toggle()
            }
            // MARK: - Delete AnimalCard 
            Button("Delete", role: .destructive) {
                print("Delete item")
            }
        } message: {
            Text("What do you want to do with the animal card?")
        }
        .sheet(isPresented: $isShowAddView) {
            AddAnimalView()
        }
        .sheet(isPresented: $isShowEditView) {
            EditAnimalCardView()
        }
    }
}

struct CardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CardButtonView()
    }
}

// MARK: - Button switch status Animal in AnimalCard
struct SwitсhStatusButtonView: View {
    var body: some View {
        Button(action: {}) {
            
        }
    }
}
