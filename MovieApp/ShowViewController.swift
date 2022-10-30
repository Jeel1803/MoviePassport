//
//  ShowViewController.swift
//  MovieApp
//
//  Created by Jeel Khadsaliya on 30/10/22.
//

import UIKit

class ShowViewController: UIViewController {

    
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text! += movie.name!
        genreLabel.text! += movie.genre!
        languageLabel.text! += movie.language!
        typeLabel.text! += movie.type!
        countryLabel.text! += movie.country!
        actorLabel.text! += movie.actor!
        ratingLabel.text = "Rating"
        picView.image = UIImage(data: movie.coverPicture!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
