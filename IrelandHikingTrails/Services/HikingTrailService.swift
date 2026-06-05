//
//  TrailService.swift
//  IrelandHikingTrails
//
//  Created by Lina Mir on 24/04/2026.
//
import Foundation

class HikingTrailService {
    private let cacheTrails = "trails_cache.json"
    
    private var cacheURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(cacheTrails)
    }
    
    func fetchTrails() async throws -> [HikingTrailAttributes] {
        
        if let cachedData = try? Data(contentsOf: cacheURL) {
            let decoded = try JSONDecoder().decode(HikingTrailResponse.self, from: cachedData)
            return decoded.features.map { $0.attributes }
        }
        
        let baseURL = "https://services-eu1.arcgis.com/CltcWyRoZmdwaB7T/ArcGIS/rest/services/GetIrelandActiveTrailRoutes/FeatureServer/0/query"
        
        guard var components = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        components.queryItems = [
            URLQueryItem(name: "where", value: "1=1"),
            URLQueryItem(name: "outFields", value: "Name, County, Description, NearestTownStart"),
            URLQueryItem(name: "f", value: "json")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        try? data.write(to: cacheURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(HikingTrailResponse.self, from: data)
        
        return decodedResponse.features.map { $0.attributes }
        
    }
}
