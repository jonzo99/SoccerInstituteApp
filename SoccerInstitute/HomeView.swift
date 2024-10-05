//
//  HomeView.swift
//  SoccerInstitute
//
//  Created by Jonzo Jimenez on 9/28/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                HeaderView
                    .padding(.top, 20)
                    .background(Color.gray)
                CurrentDay
                    .padding(.horizontal, 20)
                
                Spacer()
                VStack {
                    HStack(spacing: 20) {
                        
                        Text("Roster")
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(20)
                        Text("Calander")
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 20)
                    HStack(spacing: 20) {
                        Text("Training Plan")
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(20)
                        
                        Text("Tips")
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
        }
    }
    
    var CurrentDay: some View {
        ZStack {
            Image(.waterDrinker)
                .scaledToFit()
            
            VStack() {
                HStack {
                    Text("Today")
                        .padding(.leading, 20)
                    Spacer()
                }
                Text("Rest Day")
                    .foregroundStyle(.blue)
            }
        }
        .background(Color.gray)
        .cornerRadius(30)
    }
    
    var HeaderView: some View {
        HStack {
            Label("Coach, Jonzo", systemImage: "person.crop.circle")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.leading, 20)
            Spacer()
            Button {
                print("Go to settings menu")
            } label: {
                Image(systemName: "text.justify")
                    .padding(.trailing, 20)
            }
        }
        .font(.title2)
    }
}

#Preview {
    HomeView()
}
