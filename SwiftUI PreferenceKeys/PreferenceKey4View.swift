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

struct PreferenceKey4View: View {
    var strings = ["Something Really Really big", "Something Bigger", "Small"]
    @State private var maxWidth: CGFloat = 300
    var body: some View {
        VStack {
            ForEach(strings, id: \.self) { string in
                Text(string)
                    .overlay {
                        GeometryReader { proxy in
                            Color.clear
                                .maxViewWidth(proxy.size.width)
                        }
                    }
            }
            Rectangle()
                .fill(Color.blue)
                .frame(width: maxWidth, height: 2)
                .padding()
        }
        .onPreferenceChange(MaxViewWidth.self) { newValue in
            maxWidth = newValue
        }
     }
}

struct PreferenceKey4View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey4View()
    }
}

struct MaxViewWidth: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

extension View {
    func maxViewWidth(_ value: CGFloat) -> some View {
        self.preference(key: MaxViewWidth.self, value: value)
    }
}
