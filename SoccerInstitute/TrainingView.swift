//
//  TrainingView.swift
//  SoccerInstitute
//
//  Created by Jonzo Jimenez on 9/29/24.
//

import SwiftUI
import AVKit
import WebKit

struct TrainingView: View {
    
    let url = URL(string: "https://www.youtube.com/watch?v=CCW9Rvypvv4")!
    
    @State private var text = "This is drill is to help kids ,,,,,This is drill is to help kids This is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsvvThis is drill is to help kidsvvThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kids ,,,,,This is drill is to help kids This is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsvvThis is drill is to help kidsvvThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kids,,,,,This is drill is to help kids This is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsvvThis is drill is to help kidsvvThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kids,,,,,This is drill is to help kids This is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsvvThis is drill is to help kidsvvThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kids,,,,,This is drill is to help kids This is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kidsvvThis is drill is to help kidsvvThis is drill is to help kidsThis is drill is to help kidsThis is drill is to help kids"

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: { print("Go Back")}) {
                        Image(systemName: "chevron.down")
                            .font(.title)
                            .padding(EdgeInsets(top: 0,
                                                leading: 320,
                                                bottom: 5,
                                                trailing: 0))
                            .padding(.bottom, 5)
                    }
                }
                VStack {
                    TrainingVideoView(trainingVideoID: "CCW9Rvypvv4")
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                    Spacer()
                    
                    TextField("", text: $text, axis: .vertical)
                        .font(.title2)
                        .padding()
                        .frame(width: 350, height: 350)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct TrainingVideoView: UIViewRepresentable {
    
    var trainingVideoID: String
    
    func makeUIView(context: Context) -> WKWebView  {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: configuration)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let path = "https://www.youtube.com/embed/\(trainingVideoID)"
        guard let url = URL(string: path) else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(.init(url: url))
        //uiView.configuration.allowsInlineMediaPlayback = true
    }
}

#Preview {
    TrainingView()
}
