//
//  Data.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import Foundation
import SwiftUI

struct Hole : Identifiable{
    var id = UUID()
    var day : Int
    var title: String
    var paragraphs : [[String]]
    var coverimage : String
    var summary : String
}

class ViewModel : ObservableObject {
    @Published var holes : [Hole] = [
        Hole(day: 0,
             title: "Dark Matter",
             paragraphs: [["The Mystery of Dark Matter","Dark matter constitutes approximately 85% of the universe’s total mass but cannot be seen, as it neither emits nor absorbs light. Its elusive nature continues to puzzle scientists and inspire research."], ["Gravitational Effects and Evidence","Dark matter’s presence is inferred from its gravitational effects on galaxies and galaxy clusters. Observations like the rotation speeds of galaxies and gravitational lensing offer compelling evidence for its existence and impact."], ["The Role in Cosmic Evolution","Without dark matter, galaxies and large-scale cosmic structures could not have formed as they are today. It acts as an invisible framework, anchoring matter and shaping the universe's evolution over billions of years."]],
             coverimage: "Dark Matter",
             summary: "Dark matter is an invisible, non-luminous substance making up most of the universe's matter. Though undetectable directly, its gravitational effects shape galaxies and provide critical insights into cosmic structure and evolution."),
        Hole(day: 1,
             title: "The Evolution of the Internet",
             paragraphs: [["The Beginnings: From ARPANET to Connectivity","The internet originated in the 1960s with ARPANET, a U.S. defense project enabling communication between research institutions. This early stage laid the foundation for data packet switching, allowing computers to share information. By the 1980s, academic and government use expanded, creating the precursor to today’s interconnected digital landscape."], ["Commercialization: The World Wide Web Emerges", "The 1990s marked a pivotal shift with the introduction of the World Wide Web by Tim Berners-Lee. This innovation made the internet accessible to everyday users through browsers. Businesses seized the opportunity, leading to e-commerce and digital communication tools, which rapidly shaped the global economy and online culture."], ["Modern Era: Ubiquity and Innovation", "Today’s internet is a cornerstone of society, characterized by mobile connectivity, cloud computing, and social media. Technologies like 5G, artificial intelligence, and blockchain are transforming how we interact online. Despite these advancements, challenges like cybersecurity, misinformation, and digital divides highlight the need for sustainable growth and equitable access."]],
             coverimage: "Internet",
             summary: "The internet has evolved from a limited academic network into a global communication platform, transforming industries and society. Its development spans key stages: early research, commercialization, and the modern web."),
        Hole(day: 2,
             title: "The Multiverse",
             paragraphs: [["The Concept of the Multiverse","The multiverse is a theoretical concept proposing the existence of numerous universes, often called \"parallel\" or \"alternate\" universes. These universes could have varying physical laws, dimensions, and fundamental constants, offering endless possibilities for existence."], ["Scientific Foundations","The multiverse theory is rooted in ideas from quantum mechanics, cosmic inflation, and string theory. These fields suggest mechanisms, such as quantum fluctuations or infinite cosmic expansion, that could give rise to other universes."], ["Philosophical and Scientific Implications","The idea of a multiverse challenges our perception of reality and uniqueness. If true, it could provide answers to unresolved questions in physics and raise new ethical and existential considerations about our place in existence."]],
             coverimage: "Multiverse",
             summary: "The multiverse theory suggests that multiple universes exist beyond our own, each with distinct physical laws. It stems from quantum mechanics, cosmic inflation, and string theory, expanding our understanding of reality.")
    ]
    
    let StartDate : Date = Date(timeIntervalSince1970: 1734449232)
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    @Published var discovered : Bool = false
    let darkOrange = Color(red: 200 / 255, green: 100 / 255, blue: 0 / 255)
}
