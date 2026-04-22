//
//  AddFeedSelectFolderTableViewCell.swift
//  Collector
//
//  Created by Solid Omit on 12/8/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class AddFeedSelectFolderTableViewCell: VibrantTableViewCell {
	
	@IBOutlet weak var folderLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!
	
	override func updateVibrancy(animated: Bool) {
		super.updateVibrancy(animated: animated)
		updateLabelVibrancy(folderLabel, color: labelColor, animated: animated)
		updateLabelVibrancy(detailLabel, color: labelColor, animated: animated)
	}
	
}
