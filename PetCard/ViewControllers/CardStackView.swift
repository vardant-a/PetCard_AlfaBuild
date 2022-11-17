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
    
    var body: some View {
        Button(action: {showingAddAnimalView.toggle()}) {
            Text("Adding Animal Card")
        }
        .sheet(isPresented: $showingAddAnimalView) {
            AddAnimalView()
        }
    }
}

struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView()
    }
}
