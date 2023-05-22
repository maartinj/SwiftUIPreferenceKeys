//
// Created for SwiftUI PreferenceKeys
// by  Stewart Lynch on 2023-05-11
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct PreferenceKey1View: View {
    @State private var result = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text(result)
                    .font(.largeTitle).bold()
                HStack{
                    Rectangle()
                    Rectangle()
                }
                Rectangle()
            }
        }
    }
}

struct PreferencesKey1View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey1View()
    }
}
