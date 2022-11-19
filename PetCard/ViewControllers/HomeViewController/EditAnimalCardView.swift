//
//  EditAnimalCardView.swift
//  PetCard
//
//  Created by Алексей on 20.11.2022.
//

import SwiftUI

struct EditAnimalCardView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var faceUp = true
    var body: some View {
        VStack {
            NavigationItemsView()
            
            if faceUp {
                HStack {
                    
                }
                .frame(width: 352, height: 220)
                .background {
                    Color.backgroundColor
                }
                .cornerRadius(12)
                .padding(.bottom, 20)
            } else {
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
                .frame(width: 352, height: 220)
                .background(Color.gray)
                .cornerRadius(12)
                .padding(.bottom, 20)
            }
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


//        if faceUp {
//            
//        } else {
//            VStack {
//                HStack {
//                    Button(action: {faceUp.toggle()}) {
//                        Text("")
//                            .frame(width: 12, height: 220)
//                            .background(.black.opacity(0))
//                    }
//                    Spacer()
//                    Button(action: {faceUp.toggle()}) {
//                        Text("")
//                            .frame(width: 12, height: 220)
//                            .background(.black.opacity(0))
//                    }
//                }
//            }
//            .frame(width: 352, height: 220)
//            .background(Color.gray)
//            .cornerRadius(12)
//            .padding(.bottom, 20)
//        }
