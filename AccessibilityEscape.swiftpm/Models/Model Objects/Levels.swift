//
//  Levels.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
@MainActor
class Levels {
    static let darkMode = Level(id: 1,
                                name: "Dark Mode",
                                icon: "moon.fill",
                                color: .indigo,
                                hints: LEVEL_1_HINTS,
                                outro: LEVEL_1_OUTRO,
                                viewBuilder: AnyView(LevelDarkModeView()),
                                guideView: AnyView(GuideDarkModeView()),
                                guideDuration: 4)
    static let contrast =  Level(id: 2,
                                 name: "Contrast",
                                 icon: "circle.lefthalf.filled",
                                 color: .blue,
                                 hints: LEVEL_2_HINTS,
                                 outro: LEVEL_2_OUTRO,
                                 viewBuilder: AnyView(LevelContrastView()),
                                 guideView: AnyView(GuideContrastView()),
                                 guideDuration: 3)
    static let dynamicType = Level(id: 3,
                                   name: "Text",
                                   icon: "textformat.size",
                                   color: .purple,
                                   hints: LEVEL_3_HINTS,
                                   outro: LEVEL_3_OUTRO,
                                   viewBuilder: AnyView(LevelDynamicTypeView()),
                                   guideView: AnyView(GuideDynamicTypeView()),
                                   guideDuration: 3)
    static let motion = Level(id: 4,
                              name: "Motion",
                              icon: "circle.dotted.and.circle",
                              color: .blue,
                              hints: LEVEL_4_HINTS,
                              outro: LEVEL_4_OUTRO,
                              viewBuilder: AnyView(LevelMotionView()),
                              guideView: AnyView(GuideMotionView()),
                              guideDuration: 1)
    static let voiceOver = Level(id: 5,
                                 name: "VoiceOver",
                                 icon: "voiceover",
                                 color: .cyan,
                                 hints: LEVEL_5_HINTS,
                                 outro: LEVEL_5_OUTRO,
                                 viewBuilder: AnyView(LevelVoiceOverView()),
                                 guideView: AnyView(GuideVoiceOverView()),
                                 guideDuration: 2)
}
