//
//  CardStackView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct CardStackView: View {
    private let cardList: [String] = []
    @State private var isShowAddAnimalView = false
    @State private var faceUp = false
    var body: some View {
        if cardList.isEmpty {
            Button(action: { isShowAddAnimalView.toggle() }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width:100, height: 100)
                .frame(width: 348.829195, height: 220)
                .background(Color.init("NavBackgroundColor"))
                .cornerRadius(14.74)
            }
            .sheet(isPresented: $isShowAddAnimalView, content: { AddAnimalView() })
        } else {
            CardView(faceUp: $faceUp)
        }
    }
}

struct CardView: View {
    @Binding var faceUp: Bool
    var body: some View {
        if faceUp {
            VStack(alignment: .trailing) {
                Text("Face")
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        faceUp.toggle()
                        print("\(faceUp)")
                    }) {
                        Text("Tuped")
                    }
                    .background(Color.orange)
                }
                Spacer()
            }
            .frame(width: 348.829195, height: 220)
            .background(Color.orange)
            .cornerRadius(14.74)
        } else {
            VStack {
                Text("Back")
                Spacer()
                HStack {
                    Button(action: {
                        faceUp.toggle()
                        print("\(faceUp)")
                    }) {
                        Text("")
                            .foregroundColor(.red)
                    }
                    .background(Color.orange)
                }
                Spacer()
            }
            .frame(width: 348.829195, height: 220)
            .background(Color.gray)
            .cornerRadius(14.74)
        }
    }
}


struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView()
    }
}


struct Tools : Identifiable {
    var id: Int
    var name: String
    var offset: CGFloat
    var place: Int
}

var design_tools = [
    Tools(id: 0, name: "Sketch", offset: 0, place: 1),
    Tools(id: 1, name: "Figma", offset: 0, place: 2),
    Tools(id: 2, name: "xCode", offset: 0, place: 3),
    Tools(id: 3, name: "Ilustrator", offset: 0, place: 4),
    Tools(id: 4, name: "Word Office", offset: 0, place: 5)
]
