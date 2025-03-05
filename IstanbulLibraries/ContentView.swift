import SwiftUI
import MapKit


struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var libraries: [Library] = []
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected == false {
                Text("You don't have internet connection")
            }
            else {
                TabView {
                    LibraryListView(libraries: $libraries)
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    LibraryMapView(libraries: $libraries)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                }.task {
                    do{
                        libraries = try await Utils.getListAsync()
                    }
                    catch{
                        print("catch block")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(NetworkMonitor())
}

