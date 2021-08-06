//
//  SongList+CoreDataProperties.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//
//

import Foundation
import CoreData


extension SongList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SongList> {
        return NSFetchRequest<SongList>(entityName: "SongList")
    }

    @NSManaged public var artworkurl: String?
    @NSManaged public var trackname: String?
    @NSManaged public var artistname: String?
    @NSManaged public var previewUrl: String?

}

extension SongList : Identifiable {

}
