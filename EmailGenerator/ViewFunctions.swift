// functions to optomize view

import SwiftUI

extension View {
    
    func textFont() -> some View {
        self
            .foregroundColor(.white)
            .font(.system(size: 20, design: .monospaced))
            .fontWeight(.bold)
    }
    func customImage(name: String, size: CGSize, padding: CGFloat) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .foregroundColor(.white)
            .padding(.bottom, padding)
    }
}
