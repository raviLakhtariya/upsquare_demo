//
//  SongCell.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgSongView: UIImageView!
    @IBOutlet weak var lblSongName: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
