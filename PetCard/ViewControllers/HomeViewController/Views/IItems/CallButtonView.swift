//
//  CallButtonView.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import SwiftUI

struct CallButtonView: View {
    let number: String
    
    var body: some View {
        Button(number) {
            ApplicationManager.shared.callTo(number)
        }
    }
}

struct CallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallButtonView(number: "1111")
    }
}
