//
//  CustomListRowView.swift
//  Hike
//
//  Created by Leonardo Soares on 27/04/24.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
                
            } else if let rowLinkLabel, let rowLinkDestination {
                Link(rowLinkLabel, destination: URL(string: rowLinkDestination)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
            
        }
    }
}

#Preview {
    List(0 ..< 5) { item in
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent:  nil,
            rowTintColor: .pink,
            rowLinkLabel: "Cedo Academy",
            rowLinkDestination: "https://credo.academy"
        )
    }
}
