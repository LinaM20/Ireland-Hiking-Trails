//
//  HikingTrailModel.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 24/04/2026.
//
import Foundation

struct HikingTrailResponse: Decodable {
    let features: [HikingTrailFeature]
}

struct HikingTrailFeature: Decodable {
    let attributes: HikingTrailAttributes
}

struct HikingTrailAttributes: Hashable, Decodable, Identifiable {
    let id = UUID()
    let Name: String?
    let County: String?
    let Description: String?
    let StartPoint: String?
    let NearestTownStart: String?
    
    enum CodingKeys: String, CodingKey {
        case Name = "Name"
        case County = "County"
        case Description = "Description"
        case StartPoint = "StartPoint"
        case NearestTownStart = "NearestTownStart"
    }
}
