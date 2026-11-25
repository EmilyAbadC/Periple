
import SwiftUI

struct CreateTripView: View {
    var onBack: () -> Void
    var onCreate: () -> Void

    @State private var destination = "Paris, France"
    @State private var startDate = Date()
    @State private var endDate = Calendar.current.date(
        byAdding: .day, value: 6, to: Date()
    ) ?? Date()

    @State private var selectedVibe = "Explore"

    let vibes = ["Explore", "Relax", "Culture", "Food trip"]
    let icons = ["safari", "sparkles", "ticket", "fork.knife"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Header
                HStack {
                    Button(action: onBack) {
                        Image(systemName: "arrow.left")
                            .padding(12)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Spacer()

                    Text("Périple")
                        .font(.system(size: 22, weight: .bold))

                    Spacer()

                    Text("1 of 3")
                        .font(.caption.bold())
                        .padding(10)
                        .background(AppColors.mint.opacity(0.5))
                        .clipShape(Capsule())
                }

                // Introduction
                VStack(alignment: .leading, spacing: 5) {
                    Text("✦ NEW ADVENTURE")
                        .font(.system(size: 11, weight: .bold))
                        .tracking(2)
                        .foregroundStyle(AppColors.coral)

                    Text("Let's plan your")
                        .font(.system(size: 34, weight: .medium))

                    Text("next escape.")
                        .font(.system(size: 37, weight: .bold, design: .serif))
                        .italic()
                        .foregroundStyle(AppColors.coral)

                    Text("Tell us the basics and we'll make it unforgettable.")
                        .font(.subheadline)
                        .foregroundStyle(AppColors.muted)
                }

                // Destination
                VStack(alignment: .leading, spacing: 10) {
                    Text("Where are you going?")
                        .font(.subheadline.bold())

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(AppColors.teal)

                        TextField("Enter a destination", text: $destination)

                        Button {
                            destination = ""
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(AppColors.muted)
                        }
                    }
                    .padding(16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))

                    if destination.lowercased().contains("paris") {
                        HStack {
                            Image("paris_hero")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(RoundedRectangle(cornerRadius: 9))

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Paris, France")
                                    .font(.subheadline.bold())

                                Text("Île-de-France")
                                    .font(.caption)
                                    .foregroundStyle(AppColors.muted)
                            }

                            Spacer()

                            Image(systemName: "checkmark")
                        }
                        .foregroundStyle(AppColors.teal)
                        .padding(10)
                        .background(AppColors.mint.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }

                // Travel dates
                VStack(alignment: .leading, spacing: 10) {
                    Text("When?")
                        .font(.subheadline.bold())

                    HStack(spacing: 10) {
                        dateCard("START DATE", date: $startDate)
                        dateCard("END DATE", date: $endDate)
                    }
                }

                // Travel preferences
                VStack(alignment: .leading, spacing: 12) {
                    Text("What's the vibe?")
                        .font(.subheadline.bold())

                    HStack(spacing: 8) {
                        ForEach(vibes.indices, id: \.self) { index in
                            Button {
                                selectedVibe = vibes[index]
                            } label: {
                                VStack(spacing: 10) {
                                    Image(systemName: icons[index])
                                        .font(.system(size: 21))

                                    Text(vibes[index])
                                        .font(.system(size: 11, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 82)
                                .foregroundStyle(
                                    selectedVibe == vibes[index]
                                    ? AppColors.coral
                                    : AppColors.teal
                                )
                                .background(
                                    selectedVibe == vibes[index]
                                    ? AppColors.softPink.opacity(0.35)
                                    : Color.white
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(
                                            selectedVibe == vibes[index]
                                            ? AppColors.coral
                                            : AppColors.muted.opacity(0.25),
                                            lineWidth: 1
                                        )
                                }
                            }
                        }
                    }
                }

                // Create trip button
                Button(action: onCreate) {
                    HStack {
                        Text("Create my trip")
                            .fontWeight(.semibold)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .padding(10)
                            .background(.white.opacity(0.18))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(AppColors.coral)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .disabled(
                    destination.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    || endDate < startDate
                )
                .opacity(
                    destination.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    || endDate < startDate ? 0.5 : 1
                )
                .shadow(color: AppColors.coral.opacity(0.2),
                        radius: 8, y: 5)
            }
            .padding(22)
        }
        .foregroundStyle(AppColors.darkTeal)
        .background(AppColors.cream.ignoresSafeArea())
        .tint(AppColors.coral)
    }

    private func dateCard(
        _ title: String,
        date: Binding<Date>
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 10, weight: .semibold))
                .foregroundStyle(AppColors.muted)

            DatePicker(
                "",
                selection: date,
                displayedComponents: .date
            )
            .labelsHidden()
            .font(.caption)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    CreateTripView(onBack: {}, onCreate: {})
}
