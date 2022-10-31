//
//  MovieCell.swift
//  [iOS] TableView
//
//  Created by 유현이 on 2022/10/31.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
