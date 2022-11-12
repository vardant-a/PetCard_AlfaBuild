//
//  DetailAnimalInfoView.swift
//  PetCard
//
//  Created by Алексей on 10.11.2022.
//


import SwiftUI

struct DetailAnimalInfoView: View {
   @State private var animalTest = Animal.getAnimalLost()
    var body: some View {
        InfoCardView(animal: $animalTest)
    }
}

struct InfoCardView: View {
    @Binding var animal: Animal
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Information")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    Spacer()
                    
                    HStack {
                        Text("Name:")
                            .fontWeight(.semibold)
                        Text(animal.name)
                    }
                    HStack {
                        Text("Class")
                            .fontWeight(.semibold)
                        Text(animal.anymalType.rawValue)
                    }
                    HStack {
                        Text("Breed:")
                            .fontWeight(.semibold)
                        Text(animal.breed)
                    }
                    HStack {
                        Text("Color")
                            .fontWeight(.semibold)
                        Text(animal.color)
                    }
                    Spacer()
                }
//                Image(systemName: "pawprint.fill")
//                    .resizable()
//                    .frame(width: 250, height: 250)
//                    .foregroundColor(.gray)
            }
            .frame(width: 350, height: 600)
            .background(.green)
        } else {
            // Fallback on earlier versions
        }
    }
}



struct DetailAnimalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailAnimalInfoView()
    }
}
