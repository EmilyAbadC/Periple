//
//  HomeView.swift
//  Periple
//


import SwiftUI

struct HomeView: View {
    var onDiscover: () -> Void
    var onItinerary: () -> Void

    @State private var showTripInfo = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {

                // Paris hero
                ZStack(alignment: .bottomLeading) {
                    GeometryReader { geometry in
                        Image("paris_hero")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.height
                            )
                            .clipped()
                    }

                    LinearGradient(
                        colors: [
                            .black.opacity(0.15),
                            .clear,
                            AppColors.darkTeal.opacity(0.95)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Label("Périple", systemImage: "leaf.fill")
                                .font(.system(size: 22, weight: .bold))

                            Spacer()

                            Text("AM")
                                .font(.caption.bold())
                                .padding(12)
                                .background(.white.opacity(0.2))
                                .clipShape(Circle())
                        }

                        Spacer()

                        Text("UPCOMING TRIP")
                            .font(.system(size: 10, weight: .bold))
                            .tracking(1)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .foregroundStyle(AppColors.darkTeal)
                            .background(AppColors.yellow)
                            .clipShape(Capsule())

                        Text("Bonjour,")
                            .font(.system(size: 38, weight: .medium))

                        Text("Paris!")
                            .font(.system(size: 45, weight: .bold, design: .serif))
                            .italic()
                            .foregroundStyle(AppColors.yellow)

                        Label(
                            "June 12–18, 2026 · 6 nights",
                            systemImage: "calendar"
                        )
                        .font(.caption)
                    }
                    .foregroundStyle(.white)
                    .padding(24)
                }
                .frame(height: 340)

                // Main dashboard
                VStack(alignment: .leading, spacing: 14) {

                    Text("YOUR PARIS ADVENTURE")
                        .font(.system(size: 10, weight: .bold))
                        .tracking(1.5)
                        .foregroundStyle(AppColors.coral)

                    HStack {
                        Text("What's next?")
                            .font(.system(size: 25, weight: .medium))

                        Spacer()

                        Text("6 days to explore")
                            .font(.caption2)
                            .foregroundStyle(AppColors.muted)
                    }

                    featureCard(
                        title: "My itinerary",
                        subtitle: "3 activities planned",
                        category: "PLAN YOUR DAYS",
                        icon: "map",
                        color: AppColors.yellow,
                        iconColor: Color(hex: "99701D"),
                        action: onItinerary
                    )

                    featureCard(
                        title: "Discover places",
                        subtitle: "1 place saved",
                        category: "FIND YOUR FAVORITES",
                        icon: "safari",
                        color: AppColors.mint,
                        iconColor: AppColors.teal,
                        action: onDiscover
                    )

                    featureCard(
                        title: "Trip information",
                        subtitle: "Stay, transport & notes",
                        category: "ALL THE ESSENTIALS",
                        icon: "info.circle",
                        color: AppColors.softPink,
                        iconColor: AppColors.coral,
                        action: {
                            showTripInfo = true
                        }
                    )

                    HStack(spacing: 10) {
                        Image(systemName: "sparkles")

                        Text("Périple tip: The Louvre is quieter on Friday evenings.")
                            .font(.system(size: 11))
                    }
                    .foregroundStyle(Color(hex: "99701D"))
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppColors.yellow.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(22)
            }
        }
        .foregroundStyle(AppColors.darkTeal)
        .background(AppColors.cream.ignoresSafeArea())
        .sheet(isPresented: $showTripInfo) {
            VStack(alignment: .leading, spacing: 24) {
                Text("PARIS TRIP")
                    .font(.caption.bold())
                    .foregroundStyle(AppColors.coral)

                Text("Your essentials")
                    .font(.title)

                Label("Hôtel des Arts Montmartre", systemImage: "house")
                Divider()

                Label("Eurostar 9036", systemImage: "ticket")
                Divider()

                Label("6 nights in Paris", systemImage: "map")

                Button {
                    showTripInfo = false
                } label: {
                    Text("All set")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(18)
                        .background(AppColors.coral)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(26)
            .foregroundStyle(AppColors.darkTeal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
            .presentationBackground(AppColors.cream)
        }
    }

    private func featureCard(
        title: String,
        subtitle: String,
        category: String,
        icon: String,
        color: Color,
        iconColor: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .font(.system(size: 25))
                    .foregroundStyle(iconColor)
                    .frame(width: 55, height: 55)
                    .background(.white.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                VStack(alignment: .leading, spacing: 5) {
                    Text(category)
                        .font(.system(size: 8, weight: .bold))
                        .tracking(1)

                    Text(title)
                        .font(.system(size: 17, weight: .bold))

                    Text(subtitle)
                        .font(.system(size: 11))
                        .opacity(0.7)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .padding(10)
                    .background(.white.opacity(0.65))
                    .clipShape(Circle())
            }
            .foregroundStyle(AppColors.darkTeal)
            .padding(15)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView(onDiscover: {}, onItinerary: {})
}
