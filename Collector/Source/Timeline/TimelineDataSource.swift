//
//  TimelineDataSource.swift
//  Collector
//
//  Created by Solid Omit on 8/30/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class TimelineDataSource<SectionIdentifierType, ItemIdentifierType>: UITableViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable {
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
}

