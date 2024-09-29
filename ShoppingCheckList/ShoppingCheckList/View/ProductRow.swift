//
//  ProductRow.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//
import SwiftUI

struct ProductRow: View {
    @State var isChecked: Bool = false
    let products: Slides
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark" : "square.fill")
                .fontWeight(.semibold)
                .font(.system(size: (isChecked ? 12 : 16.5)))
                .foregroundStyle(isChecked ? .appSkyBlue : .white)
                .frame(width: 18, height: 18)
                .background(.appBlue)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .onTapGesture {
                    self.isChecked.toggle()
                }
            
            Text(products.headline ?? "")
                .font(.system(size: 16))
                .fontWeight(.regular)
            
            Spacer()
            
            Text("Shop Now")
                .underline(color: .appUnderline)
                .onTapGesture {
                    
                }
        }
    }
}
