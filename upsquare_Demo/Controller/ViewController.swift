//
//  ViewController.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var arrSongList : [SongModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    func initialSetup(){
        tblView.register(UINib.init(nibName: "SongCell", bundle: nil), forCellReuseIdentifier:"SongCell")
        tblView.tableFooterView = UIView.init()
        apiCall()
    }


}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrSongList?.count ?? 0)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SongCell = (tblView.dequeueReusableCell(withIdentifier: "SongCell") as? SongCell)!
        let object : SongModel = (arrSongList?[indexPath.row])!
        cell.lblSongName.text = object.trackName
        cell.lblAuthorName.text = object.artistName
        SDWebImageManager.shared.loadImage(with:  URL(string: object.artworkUrl100 ?? ""), options: .lowPriority, progress: nil) { (image, data, error, cacheType, isFinished, imageUrl) in
            cell.imgSongView.image = image
          }
       
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension ViewController {
    func apiCall(){
        SongViewModel.getSongList { SongModel in
            self.arrSongList = SongModel;
            self.tblView.dataSource = self
            self.tblView.delegate = self
            
            DispatchQueue.main.async {
                
                self.tblView.reloadData()
            }
           
            
        }
    }
}
