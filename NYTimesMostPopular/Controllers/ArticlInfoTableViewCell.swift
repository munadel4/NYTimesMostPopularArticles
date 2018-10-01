//
//  ArticlInfoTableViewCell.swift
//  NYTimesMostPopular
//
//  Created by Munadel Qubbaj on 10/1/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlInfoTableViewCell: UITableViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var dateAddedLabel: UILabel!
    @IBOutlet var articleHeadLineLabel: UILabel!
    @IBOutlet var articleDescriptionLabel: UILabel!
    @IBOutlet var articleImage: UIImageView!
    
    class func identifier() -> String {
        return String(describing: self)
    }

    class func nib() -> UINib {
        return UINib(nibName: identifier(), bundle: nil)
    }

    func configure(data: ArticlesResults) {
        sectionLabel.text = data.section
        dateAddedLabel.text = data.publishedDate?.convertStringDateFormat()
        articleHeadLineLabel.text = data.title
        articleDescriptionLabel.text = data.abstract
        guard let mediameta = data.media?.first?.mediaMetadata else {return}
        for metaData in mediameta {
            if let url = metaData.url {
                switch metaData.format {
                case .standardThumb?:
                    articleImage.kf.setImage(with: URL(string: url), placeholder: nil)
                default:
                    break
                }
        }
        }
    }
    
}
