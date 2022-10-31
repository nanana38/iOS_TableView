//
//  ViewController.swift
//  [iOS] TableView
//
//  Created by 유현이 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    
    var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.addMovieData()
        tableView.reloadData()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        title = "영화목록"
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.movieDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movieDataManager.movieDataArray[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            let detail = segue.destination as! DetailViewController
            let movieDataArray = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            
            
            detail.movieData = movieDataArray[indexPath.row]
        }
    }
    
}
