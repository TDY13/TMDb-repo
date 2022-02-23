//
//  TrandingMovieTableViewCell.swift
//  Dmitriy Tymofyeyev TMDb project
//
//  Created by Дмитрий Тимофеев on 08.12.2021.
//

import UIKit
import SDWebImage
class TrendingMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieOriginalNameLabel: UILabel!
    @IBOutlet weak var posterConteinerView: UIView!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()

//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.magenta.cgColor, UIColor.clear.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.locations = [0, 1.0]
//        gradientLayer.frame = bounds
//
//        moviePosterImageView.layer.insertSublayer(gradientLayer, at: 0)
       
        moviePosterImageView.layer.cornerRadius = 25
    }
    func configureWith(_ item: Movie){
        
        movieOriginalNameLabel.text = item.title
        
        var imageURLString = ""
        if let backdropPath = item.backdropPath {
         imageURLString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageURLString)
            moviePosterImageView.sd_setImage(with: imageURL, completed: nil)
        }
        
    }
}
 
