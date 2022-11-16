//
//  CardStackView.swift
//  PetCard
//
//  Created by Алексей on 16.11.2022.
//

import SwiftUI

struct CardStackView: View {
    // состояние кард листа необходимо получать из родительского ViewControllera
    var cardList: [String] = ["1"]
    @State private var showingAddAnimalView = false
    @State private var faceUp = false
    var body: some View {
        if cardList.isEmpty {
            AddAnimalButton()
        } else {
            VStack {
                HStack {
                    Spacer()
                    Button(action: { showingAddAnimalView.toggle() }) {
                            Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .rotationEffect(.degrees(180), anchor: .center)
                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $showingAddAnimalView, content: { AddAnimalView() })
                }
                .padding(.top)
                Spacer()
                AnimalCardView(faceUp: $faceUp)
                Spacer()
            }
        }
    }
    
    // MARK: - Create Button for Adding first AnimalCard
    @ViewBuilder
    private func AddAnimalButton() -> some View {
        Button(action: { showingAddAnimalView.toggle() }) {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width:100, height: 100)
            .frame(width: 348.829195, height: 220)
            .background(Color.init("NavBackgroundColor"))
            .cornerRadius(14.74)
        }
        .sheet(isPresented: $showingAddAnimalView, content: { AddAnimalView() })
    }
}

struct AnimalCardView: View {
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
