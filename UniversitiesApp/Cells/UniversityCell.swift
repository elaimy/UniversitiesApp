//
//  UniversityCell.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit

class UniversityCell: UITableViewCell {
    
    @IBOutlet weak var universityName: UILabel!
    @IBOutlet weak var universityState: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(uniDetails: UniversityRealm){
        universityName.text = uniDetails.name
        universityState.text = uniDetails.stateProvince ?? "N/A"
    }
}
