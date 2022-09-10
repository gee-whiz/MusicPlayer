
import SwiftUI

struct RecordView: View {
    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool
    let radialGradient = RadialGradient(gradient: Gradient( colors: [Color.black, .white]), center: .center, startRadius: 0, endRadius: 15)
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 200, height: 200, alignment: .center)
                .shadow(color: .gray, radius: 3, x: 0, y: 0)
            ArtistImageView(imageUrl: "https://lastfm.freetls.fastly.net/i/u/300x300/04c559b85f26278c750659d3acc6cbab.png")
            Circle()
                .fill(radialGradient)
                .frame(width: 20, height: 20, alignment: .center)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        } .rotationEffect(Angle.degrees(degrees))
            .animation(Animation.linear(duration: shouldAnimate ? 60 : 0).delay(1.5),value: shouldAnimate)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(degrees: .constant(2.0), shouldAnimate: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
