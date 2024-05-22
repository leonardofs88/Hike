//
//  SettingsView.swift
//  Hike
//
//  Created by Leonardo Soares on 25/04/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                VStack(spacing: 8) {
                    Text("Where you can find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's titme for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if let error {
                                        print("Failed request to update the app's icon: \(String(describing: error.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(.rect(cornerRadius: 16))
                            }.buttonStyle(.borderless)
                        }
                    }
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } header: {
                Text("Alternate Icons")
            }//: SECTION
            .listRowSeparator(.hidden)

            // MARK: - SECTION: ABOUT
            
            Section {
                
                // 1. Basic Labeled Content
                //                LabeledContent("Application", value: "Hike")
                
                // 2. Advanced Labeled Content
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Hike",
                    rowTintColor: .blue
                )
                
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                
                CustomListRowView(
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "elipsis.curlyBraces",
                    rowContent: "Leonardo Soares",
                    rowTintColor: .mint
                )
                
                CustomListRowView(
                    rowLabel: "Designer",
                    rowIcon: "paintpallete",
                    rowContent: "Robert Petras",
                    rowTintColor: .pink
                )
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowTintColor: .indigo,
                    rowLinkLabel: "Credo Academy",
                    rowLinkDestination: "http://credo.academy"
                )
            } header: {
                Text("ABOUT THE APP")
            } footer: {
                HStack {
                    Spacer()
                    Text("Copyright © All rights reserved.")
                    Spacer()
                }.padding(.vertical, 8)
            }
            
            // MARK: - SECTION FOOT
        } //: LIST
    }
}

#Preview {
    SettingsView()
}
