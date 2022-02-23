//
//  ViewController.swift
//  Dmitriy Tymofyeyev TMDb project
//
//  Created by Дмитрий Тимофеев on 07.12.2021.
//

import UIKit

class TrendingMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellName = String(describing: TrendingMovieTableViewCell.self)
        let cellNib = UINib(nibName: cellName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellName)
        NetworkManager.shared.requestTrendingMovies(completion:  { moviesList in
            self.moviesList = moviesList
            self.tableView.reloadData()
        })
        title = "Trending movies TMDb"
        
        self.collectionView.register(UINib(nibName: "ActorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ActorCollectionViewCell")
    }


}

extension TrendingMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
//    MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingMovieTableViewCell", for: indexPath) as? TrendingMovieTableViewCell {
            cell.configureWith(moviesList[indexPath.row])
            
            return cell
        }
//        let cell = UITableViewCell()
//        cell.textLabel?.text = moviesList[indexPath.row].originalName ?? "No name"
            return UITableViewCell() 
        }
    
//    MARK: - UITableViewDelegate
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = moviesList[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            detailsViewController.movie = movie
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
        
    }
    
}
    
extension TrendingMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewCell", for: indexPath) as? ActorCollectionViewCell{
            cell.configure()
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}
