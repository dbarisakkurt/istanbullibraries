import SwiftUI

struct DetailView: View {
    let id: Int
    let libName: String
    let ilce: String
    let phone: String
    let address: String
    let workingHours: String
    let workingDays: String
    
    
    var body: some View {
        ScrollView {
            Image(try! Utils.getLibraryExtraInfo(id: id).photoName)
            Text(libName)
                .font(.title2)
                .fontWeight(.bold)
                .scaledToFit()
            
            VStack {
                Text("District:").font(.system(size: 24).bold())
                Text(ilce).font(.system(size: 20)).frame(alignment: .center)
                Spacer()
            }
            
            VStack {
                Text("Phone:").font(.system(size: 24).bold())
                Text(phone).font(.system(size: 20)).frame(alignment: .center)
                Spacer()
            }
            
            VStack {
                Text("Email:").font(.system(size: 24).bold())
                Text(try! Utils.getLibraryExtraInfo(id: id).email).font(.system(size: 20)).frame(alignment: .center)
                Spacer()
            }
            
            VStack {
                Text("Address:").font(.system(size: 24).bold())
                Text(address).font(.system(size: 20))
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 100)
            
            VStack {
                Text("Working hours:").font(.system(size: 24).bold())
                Text(workingHours).font(.system(size: 20)).frame(alignment: .center)
                Text(correctWords(text: workingDays)).font(.system(size: 20)).frame(alignment: .center)
                Spacer()
            }
            
            HStack {
                Link("Website", destination: getLink(id: id)).font(.system(size: 20).bold())
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
    
    func getLink(id: Int) -> URL {
        var urlStr = try! Utils.getLibraryExtraInfo(id: id).engWebsiteLink
    
        if Locale.current.language.languageCode?.identifier == "tr" {
            urlStr = try! Utils.getLibraryExtraInfo(id: id).trWebsiteLink
        }

        return URL(string: urlStr)!
    }
    
    func correctWords(text: String) -> String {
        if Locale.current.language.languageCode?.identifier == "en" {
            if text == "Hergün" {
                return "Everyday"
            }
            else if text == "Pazartesi-Cuma" {
                return "Monday-Friday"
            }
            else if text == "Pazartesi-Cumartesi" {
                return "Monday-Saturday"
            }
        }
        return text
    }
}

#Preview {
    DetailView(id: 1, libName: "Ataturk Library", ilce: "Beyoglu", phone: "3265178", address: "50th Year Neighborhood Cumhuriyet Street No: 125 Beyoglu, Istanbul", workingHours: "9:00-18:00", workingDays: "Hergün")
}
