//
//  LoggerButton.swift
//  BSLoggerSample
//
//  Created by 永井涼 on 2022/09/27.
//

import Foundation
import SwiftUI

struct LoggerButton: View {
    var title: String
    var image: String
    private let action: () -> Void
    
    init(title: String, image: String, action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                Image(systemName: image)
                Text(title)
                    .bold()
            }
            .padding()
            .frame(width: 200, height: 50)
            .foregroundColor(Color.white)
            
        }
    }
}
