//
//  HoleView.swift
//  rabbithole
//
//  Created by Fabio on 17/12/24.
//

import SwiftUI

struct HoleView: View {
    var hole : Hole?
    @EnvironmentObject var viewmodel: ViewModel
    let midHeight: CGFloat = UIScreen.main.bounds.height * 0.65
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.8
    var body: some View {
        if let hol = hole {
            ScrollView{
                    VStack{
                        ZStack{
                            Image(hol.coverimage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .clipped()
                                .accessibilityLabel("Cover image of the rabbit hole named \(hol.title)")
                            
                            LinearGradient(
                                gradient: Gradient(colors: [Color(UIColor.systemGray6).opacity(0),Color(UIColor.systemGray6).opacity(0),Color(UIColor.systemGray6).opacity(0), Color(UIColor.systemGray6)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .ignoresSafeArea()
                        }
                        HStack{
                            Text(hol.title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.bottom, 10)
                            Spacer()
                            if Calendar.current.isDateInToday(viewmodel.StartDate+Double(hol.day * 86400)){
                                Text("Today")
                                    .foregroundStyle(viewmodel.darkOrange)
                                    .bold()
                            } else{
                                Text(viewmodel.formattedDate(viewmodel.StartDate+Double(hol.day * 86400)))
                                    .foregroundStyle(viewmodel.darkOrange)
                                    .bold()
                            }
                        }
                        .padding(.leading, 45)
                        .padding(.trailing, 45)
                        
                        HStack{
                            Text(hol.summary)
                            Spacer()
                        }
                        .padding(.leading, 45)
                        .padding(.trailing, 45)
                        .padding(.bottom, 5)
                        
                        ForEach(0..<hol.paragraphs.count) { index in
                            HStack{
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(hol.paragraphs[index][0])
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(viewmodel.darkOrange)
                                    
                                    Text(hol.paragraphs[index][1])
                                        .font(.body)
                                        .lineSpacing(5) // Increases spacing between lines for better readability
                                }
                                Spacer()
                            }
                            .padding(.leading, 45)
                            .padding(.trailing, 45)
                            .padding(.bottom, 10)
                        }
                    }
            }.ignoresSafeArea()
             .background(Color(UIColor.systemGray6))
        } else{
            Text("Hole")
        }
    }
}

#Preview {
    HoleView(hole: Hole(day: 1, title: "Title", paragraphs: [["ajf","jfakds"]], coverimage: "Dark Matter", summary: "Summary"))
        .environmentObject(ViewModel())
}
