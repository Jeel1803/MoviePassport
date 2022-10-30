//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Jeel Khadsaliya on 30/10/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
