//
//  CallNumberButtonView.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import SwiftUI

struct CallNumberButtonView: View {
    let number: String
    @State private var isShowAlertDialog = false
    var body: some View {
        Button(number) {isShowAlertDialog.toggle()}
            .confirmationDialog("1", isPresented: $isShowAlertDialog) {
                Button("Call \(number)") {
                    let url = URL(string: "tel://\(number)")
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
//        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
//            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}

struct CallNumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallNumberButtonView(number: "1111")
    }
}
