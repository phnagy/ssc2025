//
//  LEVEL_3.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//


// Escape Text
// Escape Text
// Escape Text
let LEVEL_3_RIDDLE = """
Not everything needs to be complicated…

The way out is simpler than you think.

Just tap and hold this text… and see what happens.
"""

let LEVEL_3_HINTS = [
    """
This text appears quite small. Maybe there's something you need to adjust in your Accessibility settings?

If you need another hint, feel free to ask again!
""",
    """
Have you checked Accessibility > Display & Text Size? There might be something you need to change!

Let me know if you need another hint.
""",
    "To escape this room, set your Dynamic Type to at least XX-Large in Larger Text under Settings > Accessibility > Display & Text Size."
]

let LEVEL_3_OUTRO = """
Wow! You actually made it out of this room? The text was unbelievably tiny!

Wait… you adjusted your Text Size in settings? Smart move!

Want to learn more about the benefits of Dynamic Type?
"""


// Guide Text
// Guide Text
// Guide Text
let LEVEL_3_GUIDE_1 = """
Dynamic Type is a **system-wide** setting that improves readability by adjusting text size based on **user preferences**, ensuring content remains clear and accessible for users with **varying vision needs**.
"""

let LEVEL_3_GUIDE_2 = """
A common mistake is relying on **fixed font** sizes for text, which can make content **difficult to read** when users adjust their text size preferences.

Instead, use **adaptive fonts** like **`.body`**, which **automatically scale** based on the user’s settings, ensuring **consistent readability** across different text sizes.
"""

let LEVEL_3_GUIDE_3 = """
System fonts **automatically scale** based on user preferences, ensuring optimal readability and accessibility. Using these system-defined text styles maintains a consistent and adaptable design across different Dynamic Type settings.

Below is a table listing system font styles with their large (default) text sizes:
"""

let LEVEL_3_GUIDE_LINKS: [WebLink] = [
    WebLink(text: "Typography",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/typography"),
    WebLink(text: "Testing system accessibility",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/accessibility/testing-system-accessibility-features-in-your-app#Ensure-text-is-legible-at-any-size"),
    WebLink(text: "SwiftUI DynamicTypeSize",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/swiftui/dynamictypesize"),
    WebLink(text: "Challenge: Large Text",
            subText: "Apple Developer News",
            link: "https://developer.apple.com/news/?id=w6r26g7r"),
    WebLink(text: "Scaling Fonts Automatically",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/uikit/scaling-fonts-automatically")
]
