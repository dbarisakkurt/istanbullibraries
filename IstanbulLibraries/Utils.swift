import Foundation


struct Library: Decodable, Identifiable {
    let id: Int
    let name: String
    let ilce: String
    let openingYear: Int
    let address: String
    let phone: String
    let workingHours: String
    let workingDays: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "Kutuphane Adi"
        case ilce = "Ilce Adi"
        case openingYear = "Acilis Yili"
        case address = "Adres"
        case phone = "Telefon"
        case workingHours = "Calisma Saatleri"
        case workingDays = "Calisma Gunleri"
    }
}

struct TypeId: Decodable {
    let type: String
    let id: String
}



struct SubResult : Decodable {
    let include_total: Bool
    let resource_id: String
    let fields: [TypeId]
    let records_format: String
    let records: [Library]
    //let _links: [String] //we don't want to decode links, so not here
    let total: Int
}

struct JsonResult: Decodable {
    let help: URL
    let success: Bool
    let result: SubResult
}

enum MyError: Error {
    case runtimeError(String)
}

class Utils {
    static func getListAsync() async throws -> [Library] {
        var libraryList: [Library] = []
        guard let url = URL(string: "https://data.ibb.gov.tr/api/3/action/datastore_search?resource_id=2ee4476c-9984-43de-96de-7aeda4da9aee") else {
            throw MyError.runtimeError("getListAsync error")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let jsonResult = try JSONDecoder().decode(JsonResult.self, from: data)
        
        for library in jsonResult.result.records {
            libraryList.append(library)
        }
        
        return libraryList
    }
    
    static func loadLibraryPhoto() {
        
    }
    
    static func getLibraryExtraInfo(id: Int) throws -> LibraryExtraInfo {
        switch id {
        case 1:
            return LibraryExtraInfo(email: " kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ataturklibrary",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ataturk-Kitapligi/5",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ataturk-Kitapligi/5",
                                    latitude: 41.03931901351988, longitude: 28.98949940622253)
        case 2:
            return LibraryExtraInfo(email: "kadineserleri@gmail.com",
                                    photoName: "kadineserleri_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Kadin-Eserleri-Kutuphanesi/24",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Kadin-Eserleri-Kutuphanesi/24",
                                    latitude: 41.030799072020045, longitude: 28.9505824274929)
        case 3:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "barismanco_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Baris-Manco-Kutuphanesi/9",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Baris-Manco-Kutuphanesi/9",
                                    latitude: 41.053977457666875, longitude: 28.87311356797007)
        case 4:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "eyupsultan_kutup", engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Eyupsultan-Kutuphanesi/13",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Eyupsultan-Kutuphanesi/13",
                                    latitude: 41.04687208350102, longitude: 28.93605724585161)
        case 5:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "asu_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Suheyl-Unver-Kutuphanesi/4",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Suheyl-Unver-Kutuphanesi/4",
                                    latitude: 41.02504715563312, longitude: 29.1046878802625)
        case 6:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "one_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Osman-Nuri-Ergin-Kutuphanesi/34",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Osman-Nuri-Ergin-Kutuphanesi/34",
                                    latitude: 41.028680050518616, longitude: 28.877118325640822)
        case 7:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "idrisgulluce_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Idris-Gulluce-Kutuphanesi/21",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Idris-Gulluce-Kutuphanesi/21",
                                    latitude: 40.850310788710296, longitude: 29.303139181453425)
        case 8:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "muallimcevdet_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Muallim-Cevdet-Kutuphanesi/30",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Muallim-Cevdet-Kutuphanesi/30",
                                    latitude: 40.886303438222356, longitude: 29.196640423782934)
        case 9:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "halilinalcik_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Halil-Inalcik-Kutuphanesi/18",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Halil-Inalcik-Kutuphanesi/18",
                                    latitude: 40.906014601837114, longitude: 29.161448454471532)
        case 10:
            return LibraryExtraInfo(email: "seslikutuphane@ibb.gov.tr",
                                    photoName: "sesli_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Sesli-Kutuphane/41",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Sesli-Kutuphane/41",
                                    latitude: 41.048408457103776, longitude: 28.935607454477733)
        case 11:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "erdembayazit_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Erdem-Bayazit-Kutuphanesi/11",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Erdem-Bayazit-Kutuphanesi/11",
                                    latitude: 41.079162213364285, longitude: 28.926227588488803)
        case 12:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "metinand_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Metin-And-Kutuphanesi/28",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Metin-And-Kutuphanesi/28",
                                    latitude: 40.99794776120561, longitude: 28.79275232525753)
        case 13:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ahmetkabakli_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Kabakli-Kutuphanesi/3",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Kabakli-Kutuphanesi/3",
                                    latitude: 41.019583787463354, longitude: 28.939838625640604)
        case 14:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "rasimozdenoren_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Rasim-Ozdenoren-Kutuphanesi/38",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Rasim-Ozdenoren-Kutuphanesi/38",
                                    latitude: 41.10470356387108, longitude: 28.785486739136076)
        case 15:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "okculartekkesi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Okcular-Tekkesi-Kutuphanesi/33",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Okcular-Tekkesi-Kutuphanesi/33",
                                    latitude: 41.0413978661487, longitude: 28.96057832354341)
        case 16:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "fatmaaliye_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Fatma-Aliye-Kutuphanesi/15",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Fatma-Aliye-Kutuphanesi/15",
                                    latitude: 41.05312125893067, longitude: 29.238009167969995)
        case 17:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "nasrettinhoca_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Nasrettin-Hoca-Kutuphanesi/32",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Nasrettin-Hoca-Kutuphanesi/32",
                                    latitude: 41.03299690240385, longitude: 28.868242754477034)
        case 18:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "hacibektasveli_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Haci-Bektas-Veli-Kutuphanesi/17",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Haci-Bektas-Veli-Kutuphanesi/17",
                                    latitude: 41.09790099956196, longitude: 28.876445510299902)
        case 19:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ilhan_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ilhan-Varank-Kutuphanesi/22",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ilhan-Varank-Kutuphanesi/22",
                                    latitude: 40.969225388346324, longitude: 29.266955512146318)
        case 20:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "aysehatun_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ayse-Hatun-Kutuphanesi/8",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ayse-Hatun-Kutuphanesi/8",
                                    latitude: 41.02611345047869, longitude: 28.934955983312786)
        case 21:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ataturkmuzesi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ataturk-Muzesi-Kutuphanesi/6",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ataturk-Muzesi-Kutuphanesi/6",
                                    latitude: 41.05653364771856, longitude: 28.98712922553993)
        case 22:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "afifebatur_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Afife-Batur-Kutuphanesi/1",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Afife-Batur-Kutuphanesi/1",
                                    latitude: 40.997095750410054, longitude: 29.04360589271758)
        case 23:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ahmedarif_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ahmed-Arif-Kutuphanesi/2",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ahmed-Arif-Kutuphanesi/2",
                                    latitude: 41.09401645537224, longitude: 28.90516819865956)
        case 24:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "odunc_kutuphane",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Mecidiyekoy-Odunc-Kutuphane/35",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Mecidiyekoy-Odunc-Kutuphane/35",
                                    latitude: 41.06633720646373, longitude: 28.995194481462605)
        case 25:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "sezaikarakoc_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Sezai-Karakoc-Kutuphanesi/43",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Sezai-Karakoc-Kutuphanesi/43",
                                    latitude: 41.21575866582286, longitude: 28.745521352632984)
        case 26:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "rifatilgaz_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Rifat-Ilgaz-Kutuphanesi/39",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Rifat-Ilgaz-Kutuphanesi/39",
                                    latitude: 41.17963772234048, longitude: 28.745926923795473)
        case 27:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "fakirbaykurt_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Fakir-Baykurt-Kutuphanesi/14",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Fakir-Baykurt-Kutuphanesi/14",
                                    latitude: 41.03146667393594, longitude: 28.702564729344747)
        case 28:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ozgenberkol_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ozgen-Berkol-Dogan-Kutuphanesi/36",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ozgen-Berkol-Dogan-Kutuphanesi/36",
                                    latitude: 40.98415446242365, longitude: 29.03088734098294)
        case 29:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "kutuphane_troleybus",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Kutuphane-Troleybus/27",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Kutuphane-Troleybus/27",
                                    latitude: 41.01217390656338, longitude: 28.961831736902223)
        case 30:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "evliyacelebi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Evliya-Celebi-Kutuphanesi/12",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Evliya-Celebi-Kutuphanesi/12",
                                    latitude: 41.03896813929581, longitude: 28.89567392586008)
        case 31:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "gultenakin_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Gulten-Akin-Kutuphanesi/16",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Gulten-Akin-Kutuphanesi/16",
                                    latitude: 41.03420271297967, longitude: 28.651009565744864)
        case 32:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "peyamisafa_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Peyami-Safa-Kutuphanesi/37",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Peyami-Safa-Kutuphanesi/37",
                                    latitude: 41.03361819030798, longitude: 28.96942203913321)
        case 33:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "yasarkemal_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Yasar-Kemal-Kutuphanesi/44",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Yasar-Kemal-Kutuphanesi/44",
                                    latitude: 41.01346137710057, longitude: 29.206369852624373)
        case 34:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "sabahattineyuboglu_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Sabahattin-Eyuboglu-Kutuphanesi/40",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Sabahattin-Eyuboglu-Kutuphanesi/40",
                                    latitude: 41.00129842939367, longitude: 28.71139301214775)
        case 35:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ipa_kitapligi",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-IPA-Istanbul-Kitapligi/23",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-IPA-Istanbul-Kitapligi/23",
                                    latitude: 40.97503957549582, longitude: 28.786975283310568)
        case 36:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "atillailhan_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Attil-Ilhan-Kutuphanesi/7",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Attil-Ilhan-Kutuphanesi/7",
                                    latitude: 40.990516441281756, longitude: 29.024992066114965)
        case 37:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "modaiskele_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Moda-Iskele-Kutuphanesi/29",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Moda-Iskele-Kutuphanesi/29",
                                    latitude: 40.97911996543508, longitude: 29.024992066114965)
        case 38:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "hhk_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Hasan-Huseyin-Korkmazgil-Kutuphanesi/19",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Hasan-Huseyin-Korkmazgil-Kutuphanesi/19",
                                    latitude: 41.08308606250648, longitude: 28.92827259865913)
        case 39:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "hid_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Hasan-Izzettin-Dinamo-Kutuphanesi/20",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Hasan-Izzettin-Dinamo-Kutuphanesi/20",
                                    latitude: 40.87606356928978, longitude: 29.231932954470395)
        case 40:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "sevgisoysal_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Sevgi-Soysal-Kutuphanesi/42",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Sevgi-Soysal-Kutuphanesi/42",
                                    latitude: 41.03980317824831, longitude: 28.985766554477344)
        case 41:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "cemilmeric_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Cemil-Meric-Kutuphanesi/10",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Cemil-Meric-Kutuphanesi/10",
                                    latitude: 41.018473800492195, longitude: 29.140785221560062)
        case 42:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "karasurlari_mevlanakapi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Kara-Surlari-Mevlanakapi-Kitapligi/25",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Kara-Surlari-Mevlanakapi-Kitapligi/25",
                                    latitude: 41.01413075414994, longitude: 28.922325404508246)
        case 43:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "fezagursey_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Feza-Gursey-Kutuphanesi-/56",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Feza-Gursey-Kutuphanesi-/56",
                                    latitude: 41.07929024579493, longitude: 29.074019979250554)
        case 44:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "sabahattinali_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Sabahattin-Ali-Kutuphanesi/52",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Sabahattin-Ali-Kutuphanesi/52",
                                    latitude: 41.06849157999051, longitude: 28.752985069822493)
        case 45:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "cenderesanat_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Cendere-Sanat-Kitapligi/53",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Cendere-Sanat-Kitapligi/53",
                                    latitude: 41.10869222827162, longitude: 28.989284167972347)
        case 46:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "iht_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ismail-Hakki-Tonguc-Kutuphanesi-/54",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ismail-Hakki-Tonguc-Kutuphanesi-/54",
                                    latitude: 41.033646472012286, longitude: 28.68285216389268)
        case 47:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "muzafferizgu_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Muzaffer-Izgu-Kutuphanesi/57",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Muzaffer-Izgu-Kutuphanesi/57",
                                    latitude: 40.92764495598944, longitude: 29.156648627488412)
        case 48:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "suatdervis_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Suat-Dervis-Kutuphanesi/59",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Suat-Dervis-Kutuphanesi/59",
                                    latitude: 41.04622738613558, longitude: 28.902462625641682)
        case 49:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "kazievi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Kazi-Evi-Kitapligi/58",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Kazi-Evi-Kitapligi/58",
                                    latitude: 41.01403918015874, longitude: 28.9524545563281)
        case 50:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "samihaayverdi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Smiha-Ayverdi-Kutuphanesi/60",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Smiha-Ayverdi-Kutuphanesi/60",
                                    latitude: 41.07286395906027, longitude: 28.88694155447892)
        case 51:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "habitat_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Habitat-Kutuphane/61",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Habitat-Kutuphane/61",
                                    latitude: 41.06499146567805, longitude: 28.98718719865835)
        case 52:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "besiktasiskele_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Besiktas-Iskele-Kutuphanesi/64",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Besiktas-Iskele-Kutuphanesi/64",
                                    latitude: 41.04125191247597, longitude: 29.007332660146623)
        case 53:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "metinaltiok_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Metin-Altiok-Kutuphanesi-/63",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Metin-Altiok-Kutuphanesi-/63",
                                    latitude: 41.05280577552543, longitude: 28.79703691029802)
        case 54:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "necaticumali_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Necati-Cumali-Kutuphanesi/62",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Necati-Cumali-Kutuphanesi/62",
                                    latitude: 40.81766924466763, longitude: 29.299972196796)
        case 55:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "kadikoyiskele_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Kadikoy-Iskele-Kutuphanesi-/66",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Kadikoy-Iskele-Kutuphanesi-/66",
                                    latitude: 40.99164697033669, longitude: 29.021548492716057)
        case 56:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "salahbirsel_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Salah-Birsel-Kutuphanesi/67",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Salah-Birsel-Kutuphanesi/67",
                                    latitude: 41.02929730051772, longitude: 29.080109812148923)
        case 57:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "naileakinci_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Naile-Akinci-Kutuphanesi/69",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Naile-Akinci-Kutuphanesi/69",
                                    latitude: 41.04386959860285, longitude: 28.937882398657408)
        case 58:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "tasmektep_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Tas-Mektep-Kutuphanesi/68",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Tas-Mektep-Kutuphanesi/68",
                                    latitude: 40.869153735743204, longitude: 29.124059796798136)
        case 59:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "ahmetbedevi_kutup",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Bedevi-Kutuphanesi/70",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Ahmet-Bedevi-Kutuphanesi/70",
                                    latitude: 41.15431381369989, longitude: 29.030561652289396)
        case 60:
            return LibraryExtraInfo(email: "kutuphanemuzeler@ibb.gov.tr",
                                    photoName: "baruthane kutuphane",
                                    engWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/en/Kitaplik/Kutuphanelerimiz/IBB-Baruthane-Kutuphane/71",
                                    trWebsiteLink: "https://ataturkkitapligi.ibb.gov.tr/tr/Kitaplik/Kutuphanelerimiz/IBB-Baruthane-Kutuphane/71",
                                    latitude: 40.97619327396594, longitude: 28.858615310294727)
        default:
            throw MyError.runtimeError("Incorrect library id")
        }
        
    }
}

struct LibraryExtraInfo {
    let email: String
    let photoName: String
    let engWebsiteLink: String
    let trWebsiteLink: String
    let latitude: Double
    let longitude: Double
}
