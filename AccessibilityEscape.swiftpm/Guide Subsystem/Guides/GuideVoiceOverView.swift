//
//  GuideVoiceOverView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI
import AVFoundation

@available(iOS 18.0, *)
struct GuideVoiceOverView: View {
    @State var useAccessibilityLabel = false
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                intro()
                problem()
                example()
                WebLinksView(links: LEVEL_5_GUIDE_LINKS)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    func intro() -> some View {
        Text(LocalizedStringKey(LEVEL_5_GUIDE_1))
            .navigationTitle("VoiceOver")
    }
    
    func problem() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_5_GUIDE_2))
        }
    }
    
    func example() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Example")
                .font(.title3)
                .bold()
            Toggle("Use `accessibilityLabel`", isOn: $useAccessibilityLabel)
                .row()
            CodeBlockView(code: useAccessibilityLabel ? "Image(\"...\")\n\t.accessibilityLabel(\"\(LEVEL_5_GUIDE_3)\")": "Image(\"...\")\n ")
            ZStack {
                Image("VoiceOver-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack {
                    Image(systemName: "speaker.wave.3.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32)
                        .padding()
                    Text("Tap for VoiceOver")
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Material.ultraThin)
            }
            .foregroundStyle(.secondary)
            .clipShape(.rect(cornerRadius: 8))
            .caption(useAccessibilityLabel ? LEVEL_5_GUIDE_3 : "istockphoto-14/612 Image")
            .accessibilityLabel(LEVEL_5_GUIDE_3)
            .accessibilityAddTraits(.isImage)
            .onTapGesture {
                speech(text: useAccessibilityLabel ? "\(LEVEL_5_GUIDE_3) Image" : "istockphoto-14/612 Image")
            }
        }
    }
    
    func speech(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}

@available(iOS 18.0, *)
#Preview {
    GuideVoiceOverView()
}

