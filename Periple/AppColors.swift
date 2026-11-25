//
//  AppColors.swift
//  Periple
//



import SwiftUI

enum AppColors {
    static let cream = Color(hex: "FCF7EE")
    static let darkTeal = Color(hex: "173F43")
    static let teal = Color(hex: "0D8585")
    static let coral = Color(hex: "F45C70")
    static let yellow = Color(hex: "FFD66E")
    static let mint = Color(hex: "B7E8E2")
    static let softPink = Color(hex: "FFD5D9")
    static let orange = Color(hex: "F9A63C")
    static let muted = Color(hex: "87999A")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(
            in: CharacterSet.alphanumerics.inverted
        )

        let value = UInt64(hex, radix: 16) ?? 0

        self.init(
            red: Double((value >> 16) & 255) / 255,
            green: Double((value >> 8) & 255) / 255,
            blue: Double(value & 255) / 255
        )
    }
}

