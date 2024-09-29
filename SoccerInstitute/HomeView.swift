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
                
                Grid() {
                    Spacer()
                    GridRow() {
                        
                        VStack {
                            Text("Soccer1")
                                .font(.title)
                                .foregroundStyle(.blue)
                                .background(Color.pink)
                        }
                        VStack {
                            Text("Soccer2")
                                .font(.title)
                                .foregroundStyle(.blue)
                                .background(Color.pink)
                        }
                       
                    }
                    Divider()
                    GridRow() {
                        VStack {
                            Text("Soccer3")
                                .font(.title)
                                .foregroundStyle(.blue)
                                .background(Color.pink)
                        }
                        VStack {
                            Text("Soccer4")
                                .font(.title)
                                .foregroundStyle(.blue)
                                .background(Color.pink)
                        }
                    }
                    Spacer()
                }
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
