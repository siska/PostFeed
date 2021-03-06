//
//  TextOnlyTableViewCell.swift
//  SiskaLabs
//
//  Created by S on 11/21/20.
//

import UIKit

public class TextOnlyTableViewCell: UITableViewCell {

    @IBOutlet var posterLabel: UILabel!
    @IBOutlet var postTextView: UITextView!

    static let identifier = "TextOnlyTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "TextOnlyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configureTextOnlyCell(poster: String, text: String) {
        posterLabel.text = poster
        postTextView.text = text
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
