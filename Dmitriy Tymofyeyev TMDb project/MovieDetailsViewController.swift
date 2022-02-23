
import UIKit
import SDWebImage
import RealmSwift


class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    let realm = try? Realm()
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageURLString = ""
        if let backdropPath = self.movie?.backdropPath {
         imageURLString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageURLString)
            self.posterImageView.sd_setImage(with: imageURL, completed: nil)
        }
        
        self.titleLabel.text = movie?.title ?? "No title :)"
        self.overviewLabel.text = movie?.overview
    }
    @IBAction func addToListWatchLaterButton(_ sender: Any) {
        
        let movieRealm = MovieRealm()
        
        movieRealm.title = self.movie?.title ?? ""
        movieRealm.popularity = self.movie?.popularity ?? 0.0
        movieRealm.overview = self.movie?.overview ?? ""
        movieRealm.id = self.movie?.id ?? 0
        movieRealm.backdropPath = self.movie?.backdropPath ?? ""
        movieRealm.mediaType = self.movie?.mediaType ?? ""
        movieRealm.posterPath = self.movie?.posterPath ?? ""

        try? realm?.write {
            realm?.add(movieRealm, update: .modified)
        }
        
        let movieName = movie?.title ?? "Movie"
            let alertMessage = movieName + " added to watch to later "
            let alert = UIAlertController(title: "Watch later", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Done", style: .default, handler: { (action) in
              self.didMove(toParent: MovieDetailsViewController())
            }))
            self.present(alert, animated: true, completion: nil)
          }
        
    }
    

