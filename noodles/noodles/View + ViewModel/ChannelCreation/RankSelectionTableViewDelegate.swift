//
//  RankSelectionTableViewDelegate.swift
//  noodles
//
//  Created by Edgar Sgroi on 24/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelCreationDelegate {
    func selectRank(indexPath: IndexPath) -> [RankModel]
    func unselectRank(indexPath: IndexPath)
}

class RankSelectionTableViewDelegate: NSObject, UITableViewDelegate {
    
    var delegate: ChannelCreationDelegate?
    var selectedRanks: [RankModel]?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RankSelectionTableViewCell else { return }
        if cell.isSelected {
            selectedRanks = delegate?.selectRank(indexPath: indexPath) ?? []
            cell.isSelected = false
            cell.checkImg.image = UIImage(named: "uncheckedButton")
        } else {
            delegate?.unselectRank(indexPath: indexPath)
            cell.isSelected = true
            cell.checkImg.image = UIImage(named: "checkedButton")
        }
    }
}
