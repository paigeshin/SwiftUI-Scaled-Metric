# Most common way

❗️Don't use on big image 

```swift
struct ContentView: View {
    // @ScaledMetric(relativeTo: .largeTitle) var imageSize: CGFloat = 100
		@ScaledMetric var imageSize: CGFloat = 100
    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}
```

# Other Ways

```swift
//
//  ContentView.swift
//  SwiftUI Scaled Matric
//
//  Created by innertainment on 2021/06/18.
//

import SwiftUI

//https://itnext.io/make-your-swiftui-app-scaleable-and-prepare-for-different-screen-sizes-eed42326b11c

//MARK: - View Size

//MARK: One Way - give padding
struct ContentView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Press me")
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        .background(
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.blue)
        )
        .padding(20)
    }
}

//MARK: Second Way - give proportional Value
struct ContentView: View {
    @ViewBuilder var body: some View {
        Text("Press me")
            .foregroundColor(.white)
            .padding()
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            )
            .padding()
    }
}

//MARK: Thrid Way - Give Scaled Metric
/*
 With SwiftUI 2, Apple added the @ScaledMetric property wrapper, that reflects the dynamic type settings. They reach from extra small to accesibility XXL.
 Although the most shouldn’t, some UI elements should scale too. But you won’t probably need this so often. Be sure, to not use it on big images and views. You can simply add the sizes as @ScaledMetric variable to your view.
 */
struct ContentView: View {
    @ScaledMetric var width: CGFloat = 60
    @ScaledMetric var height: CGFloat = 40

    var body: some View {
        Rectangle().frame(width: width, height: height)
    }
}

struct ContentView: View {
    @ScaledMetric(relativeTo: .largeTitle) var imageSize: CGFloat = 100

    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}

//MARK: Fourth Way - Give Single Scaled Matric
struct ContentView: View {
    @ScaledMetric var size: CGFloat = 1

    var body: some View {
        Rectangle().frame(width: 60 * size, height: 40 * size)
    }
}

//MARK: - Font
/*
 SwiftUI’s fonts (like .footnote, .body, .title) are already resizable. But when you want more options, you leave the predefined texts are create your owns. The don’t scale. But this is as easy as above.
 */
struct ContentView: View {
    @ScaledMetric var size: CGFloat = 1

    var body: some View {
        Text("Hello world")
            .font(
                .system(
                    size: 19 + size,
                    weight: .bold,
                    design: .rounded)
            )
    }
}
```