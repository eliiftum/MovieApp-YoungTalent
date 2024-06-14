//
//  CellView.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Home.Movie

    var body: some View {
      
            VStack(alignment: .center) {
               
                VStack(alignment: .center, spacing: 5) {
                    if let posterURL = movie.posterURL {
                        AsyncImage(url: posterURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 150)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 140, height: 150)
                        }
                    }
                    
                    
                    Text(movie.title ?? "")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .minimumScaleFactor(0.7)
                    
                    if let releaseDate = movie.releaseDate {
                        Text("Release Date: \(releaseDate)")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    
                    if let voteAverage = movie.voteAverage {
                        HStack (alignment: .center){
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(voteAverage, specifier: "%.1f")")
                        }
                        .font(.caption)
                    }
                    
                    Text(movie.overview ?? "")
                        .font(.caption)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                }
                .padding(.trailing)
            }
            .frame(width: 150,height: 300) // Kart yüksekliğini sabitleyin
        
      
    }
}

#Preview {
 
    MovieCardView(movie: mockMovie)
}

let mockMovie = Home.Movie(
    adult: false,
    backdropPath: "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
    genreIDS: [28, 12, 878],
    id: 12345,
    originalLanguage: "en",
    originalTitle: "Original Movie Title",
    overview: "This is a sample movie overview. It describes the plot and characters of the movie.",
    popularity: 85.5,
    posterPath: "/poster.jpg",
    releaseDate: "2024-06-10",
    title: "Sample Movie",
    video: false,
    voteAverage: 7.8,
    voteCount: 1234
)
