//
//  HomeView.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 14.06.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>

    @StateObject var viewmodel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView {
            if viewmodel.movies.isEmpty {
                ProgressView()
            } else {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundStyle(.red)
                    Text("Now Playing")
                        .foregroundStyle(.red)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(viewmodel.movies, id:\.self) { movie in
                        MovieCardView(movie: movie)
                            .onTapGesture {
                                guard let id = movie.id else {
                                    return
                                }
                                coordinator.show(.detailMovie(movieId: id))
                            }
                    }
                }
            }
        }
        .navigationTitle("Now Showing")
        .onAppear {
            Task {
                await self.viewmodel.fetchMovies()

            }
        }
    }
}

#Preview {
    HomeView()
}

