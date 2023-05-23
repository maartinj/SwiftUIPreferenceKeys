//
// Created for SwiftUI PreferenceKeys
// by  Stewart Lynch on 2023-05-11
// Using Swift 5.0
// Running on macOS 13.3
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch

// Link: https://www.youtube.com/watch?v=GhIP98ht7Bk&ab_channel=StewartLynch


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
                .updateString("Second")
                Rectangle()
                    .updateString("First")
            }
            .navigationTitle("Preference Keys")
        }
        .updateString("Third")
//        .preference(key: UpdateString.self, value: "First")
        .onPreferenceChange(UpdateString.self) { newValue in
            result = newValue
        }
    }
}

struct PreferencesKey1View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey1View()
    }
}

extension View {
    func updateString(_ value: String) -> some View {
        self.preference(key: UpdateString.self, value: value)
    }
}

struct UpdateString: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
