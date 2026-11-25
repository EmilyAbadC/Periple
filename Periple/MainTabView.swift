//
//  MainTabView.swift
//  Periple
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {

            Group {
                switch selectedTab {
                case 0:
                    HomeView(
                        onDiscover: {
                            selectedTab = 1
                        },
                        onItinerary: {
                            selectedTab = 2
                        }
                    )

                case 1:
                    placeholder(
                        title: "Discover places",
                        icon: "safari"
                    )

                default:
                    placeholder(
                        title: "My itinerary",
                        icon: "calendar"
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Divider()

            HStack {
                tabButton("Trip", icon: "house", index: 0)
                tabButton("Discover", icon: "safari", index: 1)
                tabButton("Itinerary", icon: "calendar", index: 2)
            }
            .padding(.top, 12)
            .padding(.bottom, 6)
            .background(AppColors.cream)
        }
        .background(AppColors.cream.ignoresSafeArea())
    }

    private func tabButton(
        _ title: String,
        icon: String,
        index: Int
    ) -> some View {
        Button {
            selectedTab = index
        } label: {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 22))

                Text(title)
                    .font(.system(size: 11))
            }
            .foregroundStyle(
                selectedTab == index
                ? AppColors.coral
                : AppColors.muted
            )
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }

    private func placeholder(
        title: String,
        icon: String
    ) -> some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 45))
                .foregroundStyle(AppColors.teal)

            Text(title)
                .font(.title2)

            Text("Coming soon")
                .font(.subheadline)
                .foregroundStyle(AppColors.muted)
        }
        .foregroundStyle(AppColors.darkTeal)
    }
}

#Preview {
    MainTabView()
}

