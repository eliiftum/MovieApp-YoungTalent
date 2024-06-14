//
//  HomepageModel.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import Foundation
enum Home {
    
    enum Constant {
        
    }
    
    struct Request: Codable {
        
    }
    
    struct Response: Codable {
        let dates: Dates?
        let page: Int?
        let results: [Movie]?
        let totalPages, totalResults: Int?

        enum CodingKeys: String, CodingKey {
            case dates, page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }


    
    // MARK: - Dates
    struct Dates: Codable {
        let maximum, minimum: String?
    }

    // MARK: - Result
    struct Movie: Codable,Hashable {
        let adult: Bool?
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int?
        let originalLanguage: String?
        let originalTitle, overview: String?
        let popularity: Double?
        let posterPath, releaseDate, title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }



  

}

extension Home.Movie {
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }

    var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w780\(backdropPath)")
    }
}

