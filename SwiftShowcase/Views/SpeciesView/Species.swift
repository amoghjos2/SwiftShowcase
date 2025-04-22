//
//  Species.swift
//  SwiftShowcase
//
//  Created by Amogh Josh on 4/15/25.
//

import Foundation

struct Specie: Hashable {
    let id: Int
    let name: String
    let imageURL: String?
}

let demoSpecies: [Specie] = [
    Specie(
        id: 4,
        name: "Candicans White Fir",
        imageURL: "https://perenual.com/storage/species_image/4_abies_concolor_candicans/og/49283844888_332c9e46f2_b.jpg"
    ),
    Specie(
        id: 5,
        name: "Blue Spruce",
        imageURL: "https://example.com/image-blue-spruce.jpg"
    ),
    Specie(
        id: 6,
        name: "Japanese Maple",
        imageURL: nil
    ),
    Specie(
        id: 7,
        name: "Weeping Willow",
        imageURL: "https://example.com/image-weeping-willow.jpg"
    ),
    Specie(
        id: 8,
        name: "Eastern Redbud",
        imageURL: "https://example.com/image-eastern-redbud.jpg"
    )
]
