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

struct PreferenceKey2View: View {
    @State private var result = 0
       var body: some View {
           NavigationStack {
               VStack {
                   Text("\(result)")
                       .font(.largeTitle).bold()
                       .updateInt(7)
                   HStack{
                       Rectangle()
                       Rectangle()
                   }
                   .updateInt(5)
                   Rectangle()
                       .updateInt(2)
               }
               .navigationTitle("Example 2")
           }
           .onPreferenceChange(UpdateInt.self) { newValue in
               result = newValue
           }
       }
}

struct PreferenceKey2View_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKey2View()
    }
}

struct UpdateInt: PreferenceKey {
    static var defaultValue: Int = 0
    
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = value + nextValue()
    }
}

extension View {
    func updateInt(_ value: Int) -> some View {
        self.preference(key: UpdateInt.self, value: value)
    }
}
