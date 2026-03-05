// ContentView.swift
import SwiftUI

// MARK: - Model
struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let description: String
    let tags: [String]
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

// MARK: - Custom Cell
struct MenuItemCell: View {
    let item: MenuItem
    let accentColor: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 56)
                            .cornerRadius(14)
                            .clipped()

            // Text
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.secondary.opacity(0.5))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
    }
}

// MARK: - List View
struct MenuListView: View {
    let items: [MenuItem]
    let accentColor: Color

    var body: some View {
        List(items) { item in
            NavigationLink(destination: MenuDetailView(item: item, accentColor: accentColor)) {
                MenuItemCell(item: item, accentColor: accentColor)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparatorTint(accentColor.opacity(0.2))
        }
        .listStyle(.plain)
        .padding(.top, 8)
    }
}

// MARK: - Detail View
struct MenuDetailView: View {
    let item: MenuItem
    let accentColor: Color

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Hero image
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    .padding(.top, 70)

                VStack(alignment: .leading, spacing: 16) {

                    // Title & subtitle
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.title)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                        Text(item.subtitle)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.secondary)
                    }

                    Divider()

                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("За артиклот")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(accentColor)
                        Text(item.description)
                            .font(.system(size: 15))
                            .foregroundColor(.primary)
                            .lineSpacing(5)
                    }

                    Divider()

                    // Tags
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Категории")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(accentColor)
                        FlowLayout(tags: item.tags, accentColor: accentColor)
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - Flow Layout
struct FlowLayout: View {
    let tags: [String]
    let accentColor: Color

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(accentColor)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(accentColor.opacity(0.12))
                        .cornerRadius(20)
                }
            }
        }
    }
}

// MARK: - Tabs
struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MenuListView(items: drinks, accentColor: .blue)
                    .navigationTitle("Пијалоци")
            }
            .tabItem {
                Label("Пијалоци", systemImage: "cup.and.saucer.fill")
            }

            NavigationStack {
                MenuListView(items: foods, accentColor: .orange)
                    .navigationTitle("Храна")
            }
            .tabItem {
                Label("Храна", systemImage: "fork.knife")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
