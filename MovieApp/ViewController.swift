//
//  ViewController.swift
//  MovieApp
//
//  Created by Jeel Khadsaliya on 29/10/22.
//

import UIKit
import CoreData


func showMessage(msg: String, controller: UIViewController)
    {
        let alert = UIAlertController(title: "", message : msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        {
            action
            in
            controller.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }

class ViewController: UIViewController {

    
  
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var year = ""
    var rating = ""
    var actor = ""
    var country = ""
    var genre = ""
    var language = ""
    var type = ""
    var name = ""
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.isHidden = true
        saveButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
   

    @IBAction func searchButton(_ sender: UIButton) {
        fetchData()
    }
    
    
    private func fetchData()
    {
        let searchString = titleTextfield.text!.replacingOccurrences(of: " ", with: "%20")
        let apiString = "https://www.omdbapi.com/?apikey=a55a386&t=" + searchString
        let omdbURL = URL(string: apiString)
        let omdbRequest = URLRequest(url: omdbURL!)
        let task = URLSession.shared.dataTask(with: omdbRequest)
        
        {
            (data,response,error)
            in
            if(error == nil)
            {
                let jsonData =  try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                print(jsonData)
                let respose = jsonData["Response"] as! String
                if(respose == "False")
                {
                    DispatchQueue.main.async
                    {
                        showMessage(msg: "No Movie found", controller: self)
                        self.titleTextfield.isHighlighted = true
                        self.titleTextfield.text = ""
                    }
                }
                else
                {
                    let coverPicture = jsonData["Poster"] as! String
                    let name = jsonData["Title"] as! String
                    let year = jsonData["Year"] as! String
                    let country = jsonData["Country"] as! String
                    let genre = jsonData["Genre"] as! String
                    let rating = jsonData["imdbRating"] as! String
                    let type = jsonData["Type"] as! String
                    let language = jsonData["Language"] as! String
                    let actor = jsonData["Actors"] as! String
                    let imageURL = URL(string: coverPicture)
                    if(coverPicture == "N/A"){
                        DispatchQueue.main.async {
                            self.picView.isHidden = false
                        }
                    }
                    else{
                        DispatchQueue.main.async {
                            self.picView.isHidden = false
                            let picData = try! Data(contentsOf: imageURL!)
                            let image = UIImage(data: picData)
                            self.picView.image = image
                            self.nameLabel.isHidden = false
                            self.nameLabel.text = name
                            self.name = name
                            self.actor = actor
                            self.year = year
                            self.country = country
                            self.genre = genre
                            self.rating = rating
                            self.type = type
                            self.language = language
                            self.saveButton.isHidden = false
                        }
                    }
                }
 
        }else
            {
                print("Something went wrong with API")
            }
        }
        task.resume()
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: context) as! Movie
        
        movie.name = name
        movie.actor = actor
        movie.language = language
        movie.rating = Double(rating)!
        movie.genre = genre
        movie.country = country
        movie.year = Int16(year)!
        movie.type = type
        movie.coverPicture = picView.image?.pngData()
        do{
            try context.save()
            showMessage(msg: "Movie added successfully!", controller: self)
        }
        catch{
            showMessage(msg: "error", controller: self)
        }
    }
    
    
}

