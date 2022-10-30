//
//  ShowMovieTableViewController.swift
//  MovieApp
//
//  Created by Jeel Khadsaliya on 30/10/22.
//

import UIKit
import CoreData
var movie : Movie!
class ShowMovieTableViewController: UITableViewController {

    var movies : [Movie]!
    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            movies = try! context.fetch(request) as! [Movie]
            showMessage(msg: "Data Fetched", controller: self)

}
        catch{
            showMessage(msg: "Data Error", controller: self)

        }
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        cell.picView.image = UIImage(data: movies[indexPath.row].coverPicture!)
        cell.nameLabel.text = movies[indexPath.row].name
        cell.languageLabel.text = movies[indexPath.row].language
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movie = movies[indexPath.row]
        performSegue(withIdentifier: "show", sender: self)
    }

   

}
