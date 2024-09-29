//
//  Extension.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//

import SwiftUI
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornersShape(radius: radius, corners: corners))
    }
    func navigationSetup(_ title: String) -> some View {
        self.modifier(MyModifier(title: title))
    }
}

struct RoundedCornersShape: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct MyModifier: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.appListHeader, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarTitleMenu {}
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "arrow.left")
                        }
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0) {
                        Spacer()
                        Text(title)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                }
            }
    }
}
