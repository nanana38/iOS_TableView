//
//  DetailViewController.swift
//  [iOS] TableView
//
//  Created by 유현이 on 2022/10/31.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    func setupUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }
}
