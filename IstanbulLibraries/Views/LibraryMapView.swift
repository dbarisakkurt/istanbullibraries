import SwiftUI
import MapKit

struct LibraryMapView: View {
    @Binding var libraries: [Library]
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.01384, longitude: 28.94966), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        Map (initialPosition: .region(region))
        {
            ForEach(libraries) { library in
                Marker(library.name, coordinate: CLLocationCoordinate2D(latitude: try! Utils.getLibraryExtraInfo(id: library.id).latitude, longitude: try! Utils.getLibraryExtraInfo(id: library.id).longitude))
            }
            
            //Marker("Ataturk Library", coordinate: CLLocationCoordinate2D(latitude: 41.03925839493875, longitude: 28.98961744088526))
        }
        .mapControls{
            MapCompass()
            MapScaleView()
        }
        .frame(width: 350, height: 250)
    }
}
