//
//  TextAndImageTableViewCell.swift
//  SiskaLabs
//
//  Created by S on 11/19/20.
//

import UIKit

public class TextAndImageTableViewCell: UITableViewCell {

    @IBOutlet var posterLabel: UILabel!
    @IBOutlet var postTextView: UITextView!
    @IBOutlet var myImageView: UIImageView!

    static let identifier = "TextAndImageTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "TextAndImageTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configureTextAndImageCell(poster: String, text: String, image: UIImage) {
        posterLabel.text = poster
        postTextView.text = text
        myImageView.image = image
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
