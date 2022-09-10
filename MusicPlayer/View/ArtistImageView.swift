
import SwiftUI

struct ArtistImageView: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl), transaction:
                    Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190, height: 190, alignment: .center)
                    .clipShape(Circle())
            default:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190, height: 190, alignment: .center)
                    .clipShape(Circle())
            }
        }
    }
}

struct ArtistImageView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistImageView(imageUrl: "")
    }
}

