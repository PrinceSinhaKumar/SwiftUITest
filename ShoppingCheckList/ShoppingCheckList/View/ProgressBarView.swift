//
//  ProgressBarView.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 29/09/24.
//
import SwiftUI

struct CircularDottedBarView: View {
    var progress: CGFloat = 0.25
    let totalSegments: Int = 12
    var frameWidth: CGFloat = 100
    var frameHeight: CGFloat = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<totalSegments, id: \.self) { index in
                SegmentShape(index: index, totalSegments: totalSegments)
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [21, 10]))
                    .rotation(Angle(degrees: -90))
                    .fill(index < Int(progress * CGFloat(totalSegments)) ? .appBlue : .appLightBlue)
                    .frame(width: frameWidth, height: frameHeight)
            }
            Circle()
                .fill(.appSkyBlue)
                .frame(width: frameWidth, height: frameHeight)
                .overlay {
                    VStack {
                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 16, weight: .bold))
                        Text("Complete")
                            .font(.system(size: 12, weight: .regular))
                    }
                    .foregroundColor(.black)
                }
        }
    }
}

struct SegmentShape: Shape {
    var index: Int
    var totalSegments: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
        let startAngle = Angle(degrees: Double(index) * (360 / Double(totalSegments)))
        let endAngle = Angle(degrees: Double(index + 1) * (360 / Double(totalSegments)))
        
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
}
