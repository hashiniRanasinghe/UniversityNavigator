//import SwiftUI
//
//
//struct CafeModel: Identifiable {
//    let id = UUID()
//    let name: String
//    let address: String
//    let hours: String
//    let waitTime: String
//    let crowdLevel: String
//    let imageName: String
//    let isOpen: Bool
//}
//
//
//let sampleCafes: [CafeModel] = [
//    CafeModel(name: "Ezone Cafe",
//              address: "222 - Ezone North, Floor G",
//              hours: "7.30am-8.30pm",
//              waitTime: "~4Mins",
//              crowdLevel: "Busy",
//              imageName: "EzoneCafe",
//              isOpen: true),
//    
//    CafeModel(name: "Hackett Cafe",
//              address: "103 - Hackett hall, Floor G",
//              hours: "7.30am-8.30pm",
//              waitTime: "~0Mins",
//              crowdLevel: "Free",
//              imageName: "hackett",
//              isOpen: true),
//    
//    CafeModel(name: "Business School Cafe",
//              address: "Business School, Floor 1",
//              hours: "7.30am-8.30pm",
//              waitTime: "~16Mins",
//              crowdLevel: "Moderate",
//              imageName: "business",
//              isOpen: true)
//]
//
//
//
//struct CanteensOverviewView: View {
//    @State private var selectedFilter: String = "All Cafes"
//    @Environment(\.dismiss) private var dismiss
//
//    var filteredCafes: [CafeModel] {
//        switch selectedFilter {
//        case "Open Now":
//            return sampleCafes.filter { $0.isOpen }
//        case "Less Crowded":
//            return sampleCafes.filter { $0.crowdLevel == "Free" || $0.crowdLevel == "Moderate" }
//        default:
//            return sampleCafes
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//            
//                HStack(spacing: 10) {
//                    FilterButton(title: "All Cafes", selectedFilter: $selectedFilter)
//                    FilterButton(title: "Open Now", selectedFilter: $selectedFilter)
//                    FilterButton(title: "Less Crowded", selectedFilter: $selectedFilter)
//                }
//                .padding(.horizontal)
//                .padding(.top, 10)
//
//           //cafes
//                ScrollView {
//                    VStack(spacing: 20) {
//                        ForEach(filteredCafes) { cafe in
//                            CafeCardView(cafe: cafe)
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarTitle("Campus Cafeterias", displayMode: .inline)
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//
//struct FilterButton: View {
//    let title: String
//    @Binding var selectedFilter: String
//
//    var body: some View {
//        Button(action: {
//            selectedFilter = title
//        }) {
//            Text(title)
//                .font(.system(size: 16, weight: .semibold))
//                .padding(.horizontal, 16)
//                .padding(.vertical, 8)
//                .background(selectedFilter == title ? Color.blue.opacity(0.2) : Color.clear)
//                .cornerRadius(20)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.black.opacity(0.4), lineWidth: 1)
//                )
//        }
//        .foregroundColor(.black)
//    }
//}
//
//
//    //cafe card
//struct CafeCardView: View {
//    let cafe: CafeModel
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            ZStack(alignment: .topTrailing) {
//                Image(cafe.imageName)
//
//                
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 160)
//                    .clipped()
//                    .cornerRadius(10)
//
//
//                    if cafe.isOpen {
//                    Text("Open")
//                        .font(.caption)
//                        .padding(6)
//                        .background(Color.green.opacity(0.3))
//                        .cornerRadius(8)
//                        .padding([.top, .trailing], 10)
//                }
//            }
//
//            Text(cafe.name)
//                .font(.headline)
//
//            HStack {
//                Text(cafe.address)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                Spacer()
//            }
//
//            Text("Est.Waiting \(cafe.waitTime)")
//                .font(.subheadline)
//
//                Text("Crowd Level - \(cafe.crowdLevel)")
//                .font(.subheadline)
//
//            HStack {
//                Image(systemName: "location")
//                Button("View") {
//            
//                }
//                .padding(.horizontal, 12)
//                .padding(.vertical, 6)
//                .background(Color.black)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//            }
//            .padding(.top, 4)
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
//    }
//}
//
//
//struct CampusCafeteriasMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        CanteensOverviewView()
//    }
//}
//
