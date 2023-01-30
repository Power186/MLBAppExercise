import SwiftUI
import MapKit

struct GameDetailView: View {
    
    // MARK: - Properties
    
    let games: Games
    
    private var coordinateRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: games.venue.location.defaultCoordinates.latitude,
                                                          longitude: games.venue.location.defaultCoordinates.longitude),
                           span: MKCoordinateSpan(latitudeDelta: 0.3,
                                                longitudeDelta: 0.3))
    }
    
    private var annotations: [Location] {
        [Location(coordinate: CLLocationCoordinate2D(latitude: games.venue.location.defaultCoordinates.latitude,
                                                     longitude: games.venue.location.defaultCoordinates.longitude))]
    }
    
    // MARK: - Initialization
    
    init(display games: Games) {
        self.games = games
    }
    
    // MARK: - View
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            venueMapView()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(spacing: 16) {
                locationLabels()
                gameStatsView()
            }
            .padding(.all, 8)
        }
    }
    
}

extension GameDetailView {
    
    @ViewBuilder
    private func venueMapView() -> some View {
        Map(coordinateRegion: .constant(coordinateRegion),
            annotationItems: annotations) {
            MapAnnotation(coordinate: $0.coordinate) {
                Image(systemName: "baseball.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.red)
            }
        }
    }
    
    @ViewBuilder
    private func locationLabels() -> some View {
        Text(games.venue.name + " - ")
            .font(.callout)
            .fontWeight(.semibold) +
        Text(games.venue.location.city + " " + games.venue.location.stateAbbrev)
            .font(.callout)
    }
    
    @ViewBuilder
    private func gameStatsView() -> some View {
        HStack(alignment: .lastTextBaseline) {
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Stats")
                    .font(.headline)
                    .foregroundColor(.green)
                Text("Runs")
                Text("Hits")
                Text("Errors")
                Text("Left On Base")
            }
            Spacer()
            VStack(alignment: .center, spacing: 8) {
                Text(games.teams.away.team.name)
                    .font(.headline)
                    .foregroundColor(.blue)
                Text("\(games.linescore.teams.away.runs)")
                Text("\(games.linescore.teams.away.hits)")
                Text("\(games.linescore.teams.away.errors)")
                Text("\(games.linescore.teams.away.leftOnBase)")
            }
            Spacer()
            VStack(alignment: .center, spacing: 8) {
                Text(games.teams.home.team.name)
                    .font(.headline)
                    .foregroundColor(.red)
                Text("\(games.linescore.teams.home.runs)")
                Text("\(games.linescore.teams.home.hits)")
                Text("\(games.linescore.teams.home.errors)")
                Text("\(games.linescore.teams.home.leftOnBase)")
            }
            Spacer()
        }
    }
    
}
