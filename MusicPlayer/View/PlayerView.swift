

import SwiftUI

struct PlayerView: View {
    
    @State private var isFavourite = false
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.black, .white]), center: .top, startRadius: 20, endRadius: 500).ignoresSafeArea()
                    .opacity(0.5)
                VStack {
                    RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                    ArmView(rotateArm: $rotateArm)
                    Button(action: {
                        shouldAnimate.toggle()
                        if shouldAnimate {
                            degrees = 3600
                            rotateArm.toggle()

                        } else {
                            rotateArm.toggle()
                            degrees = 0
                        }
                    }) {
                        HStack(spacing: 8) {
                            if !shouldAnimate {
                                Text("Play")
                                Image(systemName: "play.circle.fill")
                                    .imageScale(.large)
                            } else {
                                Text("Stop")
                                Image(systemName: "stop.fill")
                                    .imageScale(.large)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Capsule().strokeBorder(Color.black, lineWidth: 1.25))
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Now Playing" )
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .automatic) {
                    Button {
                        isFavourite.toggle()
                    } label: {
                        Image(systemName: isFavourite ? "heart.fill" : "heart" ).imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
