//
//  PersonTableViewCell.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    static let nibName = "PersonTableViewCell"
    
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.lightText
        self.selectedBackgroundView = backgroundView
        self.tintColor = UIColor.black
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func binModel(ModelEntity: User) {
        labelAge.text = ModelEntity.height
        labelName.text = ModelEntity.name
        imageAvatar.image = #imageLiteral(resourceName: "default")
        imageAvatar.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    
}
