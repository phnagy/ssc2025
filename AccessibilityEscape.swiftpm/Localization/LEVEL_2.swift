//
//  LEVEL_2.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//


// Escape Text
// Escape Text
// Escape Text
let LEVEL_2_RIDDLE = """
In **contrast** to the other rooms,
this one seems almost too simple...

The solution is right in front of you.

All it takes to escape is
tapping this text three times—quickly, in a row.
"""

let LEVEL_2_HINTS = [
    """
Maybe there's something you need to adjust in your Accessibility settings?

If you need another hint, feel free to ask again!
""",
    """
Have you checked Accessibility > Display & Text Size?  There might be something you need to change!

Let me know if you need another hint.
""",
    "To escape this room, turn on Increased Contrast in Settings > Accessibility > Display & Text Size."
]

let LEVEL_2_OUTRO = """
Wow! How did you manage to escape this room? The contrast kept getting worse and worse!

Wait… you increased the contrast in your settings? That’s brilliant!

Want to learn more about the benefits of Increased Contrast?
"""


// Guide Text
// Guide Text
// Guide Text
let LEVEL_2_GUIDE_1 = """
Increased Contrast is a **system-wide** setting that enhances **interface clarity** by boosting color contrast, making content more distinguishable for users with **visual impairments**.
"""

let LEVEL_2_GUIDE_2 = """
A common mistake is relying on **fixed** or **custom colors** for text or symbols, even when adapting for light and dark appearances. This can result in **insufficient contrast** in **Increased Contrast Mode**, making content difficult to read.

Instead, use adaptive colors like **`.red`** and **`.blue`**, which automatically adjust to different accessibility settings, ensuring optimal visibility.
"""

let LEVEL_2_GUIDE_3 = """
System colors **automatically** adjust to different themes, ensuring optimal visibility. Using these system-defined colors ensures a consistent and **accessible design** across **Light Mode**, **Dark Mode** and **Increased Contrast** settings.

The left side shows the default appearance, while the right side displays the Increased Contrast Mode:
"""

let LEVEL_2_GUIDE_4 = """
Custom colors allow for branding but must remain **accessible**. To follow **WCAG guidelines**, ensure a contrast ratio of at least 4.5:1 for text and 3:1 for UI elements. For **increased contrast**, ensure a **contrast ratio** of at least **7:1 for text** and **4.5:1 for UI elements**.
"""

let LEVEL_2_GUIDE_5 = """
To create a custom color, add a **New Color Set** in the **Assets** and enable **High Contrast** in the **Attributes Inspector** on the right.
"""

let LEVEL_2_GUIDE_LINKS: [WebLink] = [
    WebLink(text: "Accessibility Color and Effects",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/accessibility#Color-and-effects"),
    WebLink(text: "Testing system accessibility",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/accessibility/testing-system-accessibility-features-in-your-app"),
    WebLink(text: "Colors",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/color"),
    WebLink(text: "Enhanced Contrast",
            subText: "Web Content Accessibility Guidelines",
            link: "https://www.w3.org/TR/WCAG21/#contrast-enhanced"),
    WebLink(text: "SwiftUI ColorSchemeContrast",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/swiftui/colorschemecontrast")
]
