//
//  MovieDetailViewModel.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 14.06.2024.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail.Response? {
        didSet {
            updateGenresText()
        }
    }
    
    @Published var genresText: String = ""
    
    let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }

    func fetchMovieDetails() {
        TMDbNetworkManager.shared.request(endpoint: MovieRequestEndpoint.movieDetail(id: movieId).endPoint) { (response:Result<MovieDetail.Response, any Error>) in
            switch response {
            case .success(let success):
                Task {
                    await MainActor.run {
                        self.movie = success
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
    
    func updateGenresText(){
        let titles = movie?.genres?.compactMap({ genre in
            return genre.name
        }).joined(separator: ", ")
        
            
        genresText =  titles ?? ""
    }
}
