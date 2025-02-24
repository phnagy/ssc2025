//
//  LEVEL_5.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//


// Escape Text
// Escape Text
// Escape Text
let LEVEL_5_HINTS = [
    """
Hmm... the canvas seems blank, or is there an image you can’t see?

If you need another hint, feel free to ask again!
""",
    """
Maybe there's something you need to adjust in your Accessibility settings?

Let me know if you need another hint.
""",
    """
To escape this room, turn on VoiceOver in Settings > Accessibility.

It’s recommended to complete the VoiceOver tutorial first.
"""
]

let LEVEL_5_OUTRO = """
Wow, how did you know what to input without seeing?

Wait… you turned on VoiceOver? That’s a brilliant move!

Want to learn more about how VoiceOver makes apps more accessible?
"""


// Guide Text
// Guide Text
// Guide Text
let LEVEL_5_GUIDE_1 = """
VoiceOver is a **system-wide** screen reader that provides spoken feedback and navigable controls, enabling **users with visual impairments** to interact with their devices effectively.
"""

let LEVEL_5_GUIDE_2 = """
A common mistake is using images or icons **without** providing **descriptive accessibility labels**. This makes it difficult for VoiceOver users to understand their purpose and navigate the interface.

Instead, use **`.accessibilityLabel`** to provide clear, meaningful descriptions, ensuring a fully accessible experience..
"""

let LEVEL_5_GUIDE_3 = "Drone view of a sandy beach with palm trees and ocean waves."

let LEVEL_5_GUIDE_LINKS: [WebLink] = [
    WebLink(text: "VoiceOver",
            subText: "Apple Human Interface Guidelines",
            link: "https://developer.apple.com/design/human-interface-guidelines/accessibility#VoiceOver"),
    WebLink(text: "VoiceOver",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/accessibility/voiceover/"),
    WebLink(text: "Supporting VoiceOver",
            subText: "Apple Developer Documentation",
            link: "https://developer.apple.com/documentation/uikit/supporting-voiceover-in-your-app"),
    WebLink(text: "Enhance VoiceOver",
            subText: "Apple Developer News",
            link: "https://developer.apple.com/news/?id=v56qu1b3"),
    WebLink(text: "VoiceOver Maze",
            subText: "Apple Developer News",
            link: "https://developer.apple.com/news/?id=s0tca9uk")
]
