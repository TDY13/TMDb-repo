//
//  ActorCollectionViewCell.swift
//  Dmitriy Tymofyeyev TMDb project
//
//  Created by Дмитрий Тимофеев on 17.12.2021.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    func configure() {
        
        containerView.backgroundColor = .green
        containerView.layer.cornerRadius = 50
    }

}
