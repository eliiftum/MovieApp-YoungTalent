//
//  MovieDetailView.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel : MovieDetailViewModel
    
    var body: some View {
        ZStack {
            VStack {
                if let backdropURL = viewModel.movie?.backdropURL {
                    AsyncImage(url: backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .blur(radius: 3.0)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200) // Arka plan görseli yüksekliği
                }
                Color.white
            }
            ScrollView {
                
                Color.clear
                    .frame(height: 200)
                    .overlay {
                        if let posterURL = viewModel.movie?.posterURL {
                            AsyncImage(url: posterURL) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200)
                            .offset(y:100)// Poster genişliği
                        }
                    }
                
                VStack(alignment: .center, spacing: 10) {
                   

                    HStack(alignment: .top) { // Film bilgileri ve posteri yan yana
                       

                        VStack(alignment: .center, spacing: 5) {
                            Text(viewModel.movie?.title ?? "")
                                .font(.title)
                                .fontWeight(.bold)

                            VStack {
                                Text(viewModel.genresText) // Türler metni
                                    .font(.caption)
                                Text("•")
                                Text("\(viewModel.movie?.runtime ?? 0) Mins") // Süre metni
                                    .font(.caption)
                                Text("•")
                                Text(viewModel.movie?.releaseDate?.prefix(4) ?? "") // Yıl metni
                                    .font(.caption)
                            }

                            HStack(spacing: 10) { // Yıldız puanlama
                                ForEach(0..<5) { index in
                                    Image(systemName: index < Int(viewModel.movie?.voteAverage ?? 0) ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                                Text("\(viewModel.movie?.voteAverage ?? 0, specifier: "%.1f")/5")
                            }
                        }
                    }
                    .padding()

                    Text(viewModel.movie?.overview ?? "") // Konu
                        .padding()

                    // Ekstra Bilgiler: Cast, Crew, Photos... (viewModel'dan çekilecek)
                    // ...
                }
                .offset(y:100)
            }
        }
        
        .navigationTitle(viewModel.movie?.title ?? "") // Navigasyon başlığı
        .onAppear {
            viewModel.fetchMovieDetails() // Detayları yükle
        }
    }
}




#Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(movieId: 2))
}
