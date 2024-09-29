//
//  TrainingSessionView.swift
//  SoccerInstitute
//
//  Created by Jonzo Jimenez on 9/29/24.
//

import SwiftUI

struct TrainingSessionView: View {
    @State var showWarmUpDetails = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Monday")
                        .font(.title2)
                    Spacer()
                    Image(systemName: "text.justify")
                }
                .padding(.horizontal, 20)
                Spacer()
                VStack{
                    HStack{
                        Text("Warm-Up")
                            
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .foregroundStyle(.white)
                    .font(.system(.title3, weight: .bold))
                    
                    
                    if showWarmUpDetails {
                        
                        HStack {
                            
                            Image(.cartoonDribblingPassedTwoDefenders)
                                .resizable()
                                .scaledToFit()
                            //.padding(.trailing, 60)
                            Spacer()
                            VStack{
                                Text("Dribbling passed defender")
                                HStack{
                                    Image(systemName: "clock")
                                    Text("20 mins")
                                }
                                HStack {
                                    Image(systemName: "person.3.fill")
                                    Text("9-20")
                                }
                            }
                            .background(Color.white)
                            .padding(.trailing, 10)
                        }
                    }
                }
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                .background(Color.gray)
                .cornerRadius(20)
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                .onTapGesture {
                    print("Tapped")
                    showWarmUpDetails.toggle()
                }
                Spacer()
            }
        }
    }
}

struct EqualWidthHStack: Layout {
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        // Place child views.
        guard !subviews.isEmpty else { return }
      
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)

        let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
        var x = bounds.minX + maxSize.width / 2
      
        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: x, y: bounds.midY),
                anchor: .center,
                proposal: placementProposal)
            x += maxSize.width + spacing[index]
        }
    }
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        // Return a size.
        guard !subviews.isEmpty else { return .zero }

        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(0) { $0 + $1 }

        return CGSize(
            width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
            height: maxSize.height)
    }
    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero) { currentMax, subviewSize in
            CGSize(
                width: max(currentMax.width, subviewSize.width),
                height: max(currentMax.height, subviewSize.height))
        }

        return maxSize
    }
    
    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            return subviews[index].spacing.distance(
                to: subviews[index + 1].spacing,
                along: .horizontal)
        }
    }
}

#Preview {
    TrainingSessionView()
}
