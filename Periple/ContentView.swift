
import SwiftUI

struct ContentView: View {
    @State private var currentScreen = 0

    var body: some View {
        Group {
            switch currentScreen {
            case 0:
                WelcomeView {
                    navigate(to: 1)
                }

            case 1:
                CreateTripView(
                    onBack: {
                        navigate(to: 0)
                    },
                    onCreate: {
                        navigate(to: 2)
                    }
                )

            default:
                MainTabView()
            }
        }
        .preferredColorScheme(.light)
    }

    private func navigate(to screen: Int) {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = screen
        }
    }
}

#Preview {
    ContentView()
}
