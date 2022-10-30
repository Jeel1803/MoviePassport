//
//  Movie+CoreDataProperties.swift
//  MovieApp
//
//  Created by Jeel Khadsaliya on 30/10/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var actor: String?
    @NSManaged public var coverPicture: Data?
    @NSManaged public var genre: String?
    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var country: String?
    @NSManaged public var rating: Double
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
