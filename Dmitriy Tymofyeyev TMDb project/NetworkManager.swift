//
//  NetworkManager.swift
//  Dmitriy Tymofyeyev TMDb project
//
//  Created by Дмитрий Тимофеев on 07.12.2021.
//

import Foundation
import Alamofire
import SDWebImage




struct NetworkManager {
   
    static let shared = NetworkManager()
    
    private init() { }
    
    func requestTrendingMovies(completion: @escaping(([Movie]) -> ())) {
      
        let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=1f16d3a486ad339e3b18ad8074eb811d"
        
        AF.request(url).responseJSON { response in
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(JSONResponse.self, from: response.data!) {
                let movies = data.results ?? []
                completion(movies)
        }
        
    }
    }
}
