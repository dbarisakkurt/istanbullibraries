import SwiftUI

struct LibraryListView: View {
    @Binding var libraries: [Library]
    
    var body: some View {
        List {
            ForEach(libraries, content: {library in NavigationLink(library.name, destination: DetailView(id: library.id, libName: library.name, ilce: library.ilce, phone: library.phone, address: library.address, workingHours: library.workingHours, workingDays: library.workingDays))})
        }
    }
}
