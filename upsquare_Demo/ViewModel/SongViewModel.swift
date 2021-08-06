//
//  SongViewModel.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//

import Foundation

class SongViewModel {
   static var arrSongModel : [SongModel]?
    static var songRepo = SongRepository()
    
    class func getSongList(completionHandler:@escaping(_ result:[SongModel]?)->Void){
        
        if let songData = songRepo.fetch(){
            completionHandler(songData)
        }else{
            let url = URL.init(string: APIURL.songUrl)!
            APIManager.callGetAPI(url: url, resultType: SongListResponse.self) { response in
                arrSongModel = [SongModel]()
                if let responseData = response{
                    for i in 0..<(responseData.results?.count ?? 0){
                        let songModelObject = SongModel(_artworkUrl100: responseData.results?[i].artworkUrl100, _trackName: responseData.results?[i].trackName, _artistName: (responseData.results?[i].artistName ?? ""), _previewUrl: responseData.results?[i].previewUrl)
                        
                        
                        arrSongModel?.append(songModelObject)
                        //let songRepo = SongRepository()
                        songRepo.create(record: songModelObject)
                    }
                    
                  
                }
                
                
                if((arrSongModel?.count ?? 0) > 0){
                    _ = completionHandler(arrSongModel)
                }
                
               
            }
        }
        
       
    }
    
   
}

class SongModel{
    var artworkUrl100 : String?
    var trackName : String?
    var artistName : String?
    var previewUrl : String?
    
    init() {
        
    }
    
    init(_artworkUrl100:String?,_trackName:String?,_artistName:String,_previewUrl:String?) {
        self.artworkUrl100 = _artworkUrl100;
        self.trackName = _trackName;
        self.artistName = _artistName;
        self.previewUrl = _previewUrl;
    }

}
