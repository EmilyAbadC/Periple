
import SwiftUI

struct WelcomeView: View {
    var onStart: () -> Void

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {

                // Travel collage
                ZStack {
                    AppColors.teal

                    Circle()
                        .fill(AppColors.yellow)
                        .frame(width: 200, height: 200)
                        .offset(x: 150, y: -160)

                    RoundedRectangle(cornerRadius: 2)
                        .fill(AppColors.orange)
                        .frame(width: 175, height: 220)
                        .padding(7)
                        .background(.white)
                        .rotationEffect(.degrees(-14))
                        .offset(x: -95, y: -5)

                    Image("paris_hero")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 220)
                        .background(AppColors.mint)
                        .clipped()
                        .padding(7)
                        .background(.white)
                        .rotationEffect(.degrees(10))
                        .offset(x: 85, y: 0)

                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(.white, AppColors.coral)
                        .offset(x: 10, y: -105)
                }
                .frame(height: geometry.size.height * 0.45)
                .clipped()

                // Welcome content
                VStack(alignment: .leading, spacing: 20) {

                    HStack(spacing: 5) {
                        Image(systemName: "leaf.fill")
                            .foregroundStyle(AppColors.teal)

                        Text("Périple")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(AppColors.darkTeal)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Your trip,")
                            .font(.system(size: 40, weight: .medium))
                            .foregroundStyle(AppColors.darkTeal)

                        Text("your way.")
                            .font(.system(size: 43, weight: .bold, design: .serif))
                            .italic()
                            .foregroundStyle(AppColors.coral)
                    }

                    Text("Personalized journeys, thoughtfully planned for the way you love to travel.")
                        .font(.system(size: 16))
                        .foregroundStyle(AppColors.darkTeal.opacity(0.75))
                        .lineSpacing(5)

                    Button(action: onStart) {
                        HStack {
                            Text("Get started")
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
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .shadow(color: AppColors.coral.opacity(0.25),
                            radius: 10, y: 6)

                    Text("I already have an account")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(AppColors.teal)
                        .frame(maxWidth: .infinity)

                    Spacer(minLength: 0)
                }
                .padding(28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 36,
                        topTrailingRadius: 36
                    )
                    .fill(AppColors.cream)
                )
                .offset(y: -25)
            }
            .background(AppColors.cream)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView(onStart: {})
}
