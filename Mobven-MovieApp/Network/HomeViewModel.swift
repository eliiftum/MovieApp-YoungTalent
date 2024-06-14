//
//  HomeViewModel.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 14.06.2024.
//

import SwiftUI

protocol HomeViewDelegate: ObservableObject {
    var movies : [Home.Movie] { get set }
    func fetchMovies()
}

class HomeViewModel: ObservableObject {
    @Published var movies : [Home.Movie] = []
    
    func fetchMovies() async {
        TMDbNetworkManager.shared.request(endpoint: MovieRequestEndpoint.nowPlaying.endPoint) { (response: Result<Home.Response, any Error>) in
            switch response {
            case .success(let success):
                guard let movies = success.results else {return}
                Task {
                    await self.updateMovies(movies: movies)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    @MainActor
    func updateMovies(movies: [Home.Movie]) {
        self.movies = movies
    }
    
}

