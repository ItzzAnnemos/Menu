//
//  Models.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let description: String
    let tags: [String]
}

struct Comment: Codable, Identifiable {
    let id: UUID
    let text: String
    let imageData: Data?

    init(text: String, imageData: Data? = nil) {
        self.id = UUID()
        self.text = text
        self.imageData = imageData
    }

    var image: UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}

struct Location {
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
}

// MARK: - Data
let drinks: [MenuItem] = [
    MenuItem(title: "Еспресо", subtitle: "Силно италијанско црно кафе", imageName: "espresso",
             description: "Еспресото е концентриран облик на кафе подготвен со притискање на врела вода под висок притисок низ фино мелено кафе. Потекнува од Италија и е основа за многу кафе напивки.",
             tags: ["Топло", "Кафе", "Италијанско", "Без млеко"]),

    MenuItem(title: "Капучино", subtitle: "Еспресо со млечна пена", imageName: "cappuccino",
             description: "Капучиното е класична италијанска кафе напивка составена од еспресо, топло млеко и густа млечна пена. Традиционално се служи во помала чаша и е омилено утринско пијалче.",
             tags: ["Топло", "Кафе", "Со млеко", "Италијанско"]),

    MenuItem(title: "Сок од портокал", subtitle: "Свежо исцеден сок од портокал", imageName: "orange-juice",
             description: "Свежо исцеден портокалов сок богат со витамин Ц. Природно сладок и освежувачки, совршен за утро или по оброк. Се подготвува од свежи портокали без додаток на шеќер.",
             tags: ["Ладно", "Природно", "Витамини", "Без кофеин"]),

    MenuItem(title: "Зелен чај", subtitle: "Лесен чај богат со антиоксиданси", imageName: "green-tea",
             description: "Зелениот чај потекнува од Кина и Јапонија и е познат по своите здравствени придобивки. Содржи антиоксиданси и мала количина кофеин, идеален за опуштање.",
             tags: ["Топло", "Чај", "Здраво", "Антиоксиданси"]),

    MenuItem(title: "Лимонада", subtitle: "Освежувачка лимон и нане комбинација", imageName: "lemonade",
             description: "Домашна лимонада подготвена од свежи лимони, нане и природен шеќер. Совршено освежување за топли летни денови, служена со коцки мраз.",
             tags: ["Ладно", "Освежувачко", "Летно", "Без кофеин"]),

    MenuItem(title: "Милкшејк", subtitle: "Кремаст сладолед пијалок", imageName: "milkshake",
             description: "Кремаст милкшејк подготвен од квалитетен сладолед и свежо млеко. Достапен во повеќе вкусови — чоколадо, јагода и ванила. Совршен десертен пијалок.",
             tags: ["Ладно", "Десерт", "Со млеко", "Слатко"]),

    MenuItem(title: "Газирана вода", subtitle: "Ладна карбонизирана минерална вода", imageName: "sparkling-water",
             description: "Природна минерална вода со природна карбонизација. Освежувачка и лесна, совршена придружба на секој оброк или сама по себе.",
             tags: ["Ладно", "Без калории", "Природно", "Без кофеин"]),

    MenuItem(title: "Топло чоколадо", subtitle: "Богата и кремаста какао напивка", imageName: "hot-chocolate",
             description: "Богато топло чоколадо подготвено од premium какао и свежо млеко. Совршено за студени зимски денови, служено со шлаг и малку цимет.",
             tags: ["Топло", "Слатко", "Зимско", "Со млеко"]),
]

let foods: [MenuItem] = [
    MenuItem(title: "Маргарита пица", subtitle: "Класична домат, моцарела и босилек", imageName: "margherita-pizza",
             description: "Класичната неаполитанска пица со домашен доматен сос, свежа моцарела и босилек. Подготвена во традиционална пекарска печка на висока температура за совршена тенка кора.",
             tags: ["Италијанско", "Вегетаријанско", "Пица", "Печено"]),

    MenuItem(title: "Цезар салата", subtitle: "Ромаин, крутони и цезар дресинг", imageName: "caesar-salad",
             description: "Класична Цезар салата со свеж ромаин зелен салат, хрскави крутони и автентичен Цезар дресинг. Посипана со пармезан и поднесена со лимон.",
             tags: ["Салата", "Здраво", "Свежо", "Американско"]),

    MenuItem(title: "Чизбургер", subtitle: "Говедско месо со чедар и кисели краставички", imageName: "cheeseburger",
             description: "Сочен чизбургер со 200г говедско месо, топен чедар, свежа салата, домат и кисели краставички. Служен со домашен сос и помфрит по избор.",
             tags: ["Брза храна", "Говедско", "Американско", "Грилирано"]),

    MenuItem(title: "Шпагети", subtitle: "Паста со богат болоњезе сос", imageName: "spaghetti",
             description: "Автентични шпагети со традиционален болоњезе сос подготвен со говедско месо, домати и зачини. Варени al dente и посипани со свеж пармезан.",
             tags: ["Италијанско", "Паста", "Говедско", "Топло"]),

    MenuItem(title: "Суши ролни", subtitle: "Ролни со свеж лосос и авокадо", imageName: "sushi-rolls",
             description: "Свежи суши ролни со норвешки лосос, авокадо и краставица, завиткани во ориз и нори лист. Служени со соја сос, васаби и ѓумбир.",
             tags: ["Јапонско", "Свежо", "Морска храна", "Здраво"]),

    MenuItem(title: "Такос", subtitle: "Зачинето пилешко во мека тортиља", imageName: "tacos",
             description: "Мексикански такос со зачинето пилешко месо, свежа салса, авокадо крем и сирење. Служени во меки тортиљи со лимон и свеж коријандер.",
             tags: ["Мексиканско", "Пилешко", "Зачинето", "Свежо"]),

    MenuItem(title: "Палачинки", subtitle: "Палачинки со јаворов сируп", imageName: "pancakes",
             description: "Американски пухкави палачинки подготвени по класичен рецепт. Служени со путер, свежи бобинки и јаворов сируп. Совршен избор за појадок.",
             tags: ["Слатко", "Појадок", "Американско", "Вегетаријанско"]),

    MenuItem(title: "Грчка салата", subtitle: "Фета, маслинки, домат и краставица", imageName: "greek-salad",
             description: "Традиционална грчка салата со свеж домат, краставица, маслинки, кромид и фета сирење. Зачинета со маслиново масло, оригано и морска сол.",
             tags: ["Грчко", "Вегетаријанско", "Свежо", "Здраво"]),
]

struct CocktailResponse: Decodable {
    let drinks: [Cocktail]
}

struct Cocktail: Decodable, Identifiable {
    let id: String
    let name: String
    let category: String
    let instructions: String
    let imageURL: String
    let ingredients: [String]

    enum CodingKeys: String, CodingKey {
        case id           = "idDrink"
        case name         = "strDrink"
        case category     = "strCategory"
        case instructions = "strInstructions"
        case imageURL     = "strDrinkThumb"
        case ingredient1  = "strIngredient1"
        case ingredient2  = "strIngredient2"
        case ingredient3  = "strIngredient3"
        case ingredient4  = "strIngredient4"
        case ingredient5  = "strIngredient5"
        case ingredient6  = "strIngredient6"
        case ingredient7  = "strIngredient7"
        case ingredient8  = "strIngredient8"
        case ingredient9  = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id           = try container.decode(String.self, forKey: .id)
            name         = try container.decode(String.self, forKey: .name)
            category     = try container.decode(String.self, forKey: .category)
            instructions = try container.decode(String.self, forKey: .instructions)
            imageURL     = try container.decode(String.self, forKey: .imageURL)

            // Collect all non-nil, non-empty ingredients
            let raw = [
                container.decodeIngredient(.ingredient1),
                container.decodeIngredient(.ingredient2),
                container.decodeIngredient(.ingredient3),
                container.decodeIngredient(.ingredient4),
                container.decodeIngredient(.ingredient5),
                container.decodeIngredient(.ingredient6),
                container.decodeIngredient(.ingredient7),
                container.decodeIngredient(.ingredient8),
                container.decodeIngredient(.ingredient9),
                container.decodeIngredient(.ingredient10),
                container.decodeIngredient(.ingredient11),
                container.decodeIngredient(.ingredient12),
                container.decodeIngredient(.ingredient13),
                container.decodeIngredient(.ingredient14),
                container.decodeIngredient(.ingredient15),
            ]
            ingredients = raw.compactMap { $0 }
        }
    
    var isComplex: Bool {
        ingredients.count >= 4
    }
}

extension KeyedDecodingContainer where K == Cocktail.CodingKeys {
    func decodeIngredient(_ key: Cocktail.CodingKeys) -> String? {
        let value = try? decodeIfPresent(String.self, forKey: key)
        guard let v = value, !v.trimmingCharacters(in: .whitespaces).isEmpty else { return nil }
        return v
    }
}
