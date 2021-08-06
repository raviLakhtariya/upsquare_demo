//
//  SongRepository.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//

import Foundation
import CoreData

protocol SongDataRepositor {
    func create(record:SongModel)
    func fetch()->[SongModel]?
}

struct SongRepository : SongDataRepositor{
    func create(record: SongModel) {
        let songData = SongList(context: PersistantStorage.shared.context)
        songData.artistname = record.artistName
        songData.artworkurl = record.artworkUrl100
        songData.previewUrl = record.previewUrl
        songData.trackname = record.trackName
        PersistantStorage.shared.saveContext()
    }
    
    func fetch() -> [SongModel]? {
        let fetchRequest = NSFetchRequest<SongList>(entityName: "SongList")
        fetchRequest.returnsObjectsAsFaults = false
             do {
                let result = try PersistantStorage.shared.context.fetch(fetchRequest)//context.fetch(request)
                var arrSongModel : [SongModel] = [SongModel]()
                for data in result {
                    arrSongModel.append(data.convertSongToSongModel()!)
                 }
                return arrSongModel
                 
             } catch {
                 
                 print("Failed")
             }
        return nil
    }
    

    
    

}
extension SongList{
    func convertSongToSongModel()->SongModel?{
        return SongModel(_artworkUrl100: self.artworkurl, _trackName: self.trackname, _artistName: ( self.artistname ?? ""), _previewUrl:  self.previewUrl)
    }
}
