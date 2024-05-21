//
//  SettingsView.swift
//  KitchenNotebook
//
//  Created by Jayden Wong on 5/5/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Verson: v1.0").navigationTitle("Chinese Kitchen")
                Spacer()
                Text("Author: Jayden Wong")
                Text("Course: CSC680")
                Text("Date: 05/13/2024")
                Spacer()
            }
            .font(.title)
        }
    }
}

#Preview {
    AboutView()
}
