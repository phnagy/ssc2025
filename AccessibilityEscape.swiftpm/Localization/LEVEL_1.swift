//
//  LEVEL_1.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//


// Escape Text
// Escape Text
// Escape Text
let LEVEL_1_RIDDLE_LIGHT = """
Wow, it’s so light in here…

The glare makes it hard to focus, and some details seem to disappear.

A darker setting might reveal what’s hidden.
"""

let LEVEL_1_RIDDLE_DARK = """
It’s really dark in here…

The darkness makes it hard to focus, and some details seem to disappear.

A lighter setting might reveal what’s hidden.
"""

let LEVEL_1_HINTS = [
    """
Maybe there's something you need to adjust in your settings?

If you need another hint, feel free to ask again!
""",
    """
Have you checked your Display & Brightness settings? There might be something you need to change!

Let me know if you need another hint.
""",
    "To escape this room, switch your Appearance (Light or Dark Mode) in the Display & Brightness settings."
]

let LEVEL_1_OUTRO = """
Wow! You actually found a way out!

Wait… you changed the appearances? That’s awesome!

Want to learn more about Dark Mode?
"""


// Guide Text
// Guide Text
// Guide Text
let LEVEL_1_GUIDE_1 = """
Dark Mode is a **system-wide** setting that uses a dark **colour scheme** for a more comfortable viewing experience in low light conditions
"""

let LEVEL_1_GUIDE_2 = """
A common mistake is using **fixed colors** for text or symbols, such as setting the text color to black or white. This can make the text **invisible** in **Dark Mode**, as it doesn’t adapt to different backgrounds. 

Instead, use adaptive colors like **`.primary`**, which automatically adjust based on the system’s appearance.
"""

let LEVEL_1_GUIDE_3 = """
System colors **automatically** adjust to different themes, ensuring optimal visibility. Using these system-defined colors ensures a consistent and **accessible design** across **Light Mode** and **Dark Mode** settings.
"""

let LEVEL_1_GUIDE_4 = """
Custom colors allow for branding but must remain **accessible**. To follow **WCAG guidelines**, ensure a **contrast ratio** of at least **4.5:1 for text** and **3:1 for UI elements**.
"""

let LEVEL_1_GUIDE_5 = """
To create a custom color, add a **New Color Set** in the **Assets** and enable the **Dark appearance** in the **Attributes Inspector** on the right.
"""

let LEVEL_1_GUIDE_LINKS: [WebLink] = [
    WebLink(text: "Dark Mode",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/dark-mode"),
    WebLink(text: "Supporting Dark Mode",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/uikit/supporting-dark-mode-in-your-interface"),
    WebLink(text: "Colors",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/color"),
    WebLink(text: "Minimum Contrast",
            subText: "Web Content Accessibility Guidelines",
            link: "https://www.w3.org/TR/WCAG21/#contrast-minimum"),
    WebLink(text: "SwiftUI ColorScheme",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/swiftui/colorscheme")
]
