//
//  LEVEL_4.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//


// Escape Text
// Escape Text
// Escape Text
let LEVEL_4_HINTS = [
    """
Maybe there's something you need to adjust in your Accessibility settings, to make things move less?

If you need another hint, feel free to ask again!
""",
    """
Have you checked Accessibility > Motion? There might be something you need to change!

Let me know if you need another hint.
""",
    "To escape this room, turn on Reduced Motion in Settings > Accessibility > Motion."
]

let LEVEL_4_OUTRO = """
Wow, I am not sure if I would be able to catch that button.

Wait you turned on reduce motions? What a genius idea.

Do you want to learn more about Reduce Motion?
"""


// Guide Text
// Guide Text
// Guide Text
let LEVEL_4_GUIDE_1 = """
Reduced Motion is a **system-wide** setting that **limits animations** and **motion effects**, providing a more comfortable experience for users who are **sensitive to movement**.
"""

let LEVEL_4_GUIDE_2 = """
A common mistake is relying on **uncontrolled animations** or motion effects **without considering user preferences**. This can cause discomfort for users who have Reduced Motion enabled.

Instead, check the accessibility environment value 'reduceMotion' and provide a less animated or static alternative when necessary.
"""

let LEVEL_4_GUIDE_CODE_TRUE = """
@Environment(\\.accessibilityReduceMotion) private var reduceMotion
@State private var animate = false

Text("Hello World!")
    .scaleEffect(animate ? 1.5 : 1.0)
    .task {
        guard !reduceMotion else { return }
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            animate.toggle()
        }
    }
"""

let LEVEL_4_GUIDE_CODE_FALSE = """
@State private var animate = false

Text("Hello World!")
    .scaleEffect(animate ? 1.5 : 1.0 )
    .task {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            animate.toggle()
        }
    }
   
   
"""

let LEVEL_4_GUIDE_LINKS: [WebLink] = [
    WebLink(text: "Motion",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Motion"),
    WebLink(text: "Testing system accessibility",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/accessibility/testing-system-accessibility-features-in-your-app#All-platforms"),
    WebLink(text: "SwiftUI accessibilityReduceMotion",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/swiftui/environmentvalues/accessibilityreducemotion")
]
