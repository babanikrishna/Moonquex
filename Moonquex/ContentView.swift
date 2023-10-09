//
//  ContentView.swift
//  Moonquex
//
//  Created by Krishna Babani on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedMoonquake: MoonQuakes?
    @State private var showLatLongLines: Bool = false
    @State private var showMoonquakes: Bool = false
    @State private var showLunarData: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Show Latitude and Longitude Lines", isOn: $showLatLongLines)
                .padding(.horizontal, 20)
            Toggle("Show Moonquakes", isOn: $showMoonquakes)
                .padding(.horizontal, 20)
            Toggle("Show Lunar Data", isOn: $showLunarData)
                .padding(.horizontal, 20)
            
            MoonView(
                showLatLongLines: $showLatLongLines,
                                showMoonquakes: $showMoonquakes,
                                showLunarData: $showLunarData,
                                moonquakeTapped: { moonquake in
                                    self.selectedMoonquake = moonquake
                                }
            )
            .sheet(item: $selectedMoonquake) { moonquake in
                ScrollView {
                    
                    HStack {
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Moonquake Data")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Station: \(moonquake.station)")
                                .fontWeight(.semibold)
                            Text("Category: \(moonquake.category)")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .leading) {
                            Text("Location: \(moonquake.latitude), \(moonquake.longitude)")
                            Text("Date: \(moonquake.date)")
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            Text("Depth: \(moonquake.depth ?? 0.0)")
                            Text("Magnitude: \(moonquake.magnitude ?? 0.0)")
                        }
                        .padding(.horizontal, 20)
                    }
                        
                        Spacer()
                }
                    .padding(.top, 20)
                    
                    ZStack(alignment: .leading) {
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .green, .yellow, .red]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(height: 20)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.primary, lineWidth: 1)
                        )
                        
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 2, height: 20)
                            .offset(x: CGFloat((moonquake.magnitude ?? 0.0) / 3.5) * (UIScreen.main.bounds.width - 40) - 1)
                    }

                                .padding(.horizontal, 20)
                }
                .presentationDetents([.fraction(0.4), .medium])
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
