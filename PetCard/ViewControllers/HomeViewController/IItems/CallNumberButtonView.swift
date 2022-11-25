//
//  CallNumberButtonView.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import SwiftUI

struct CallNumberButtonView: View {
    let number: String
    
    var body: some View {
        Button(number) { callTo(number) }
    }
    
    //  MARK: - Call User
    private func callTo(_ number: String) {
        let url = URL(string: "tel://\(number)")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}

struct CallNumberButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallNumberButtonView(number: "1111")
    }
}
