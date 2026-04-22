//
//  RSImage-AppIcons.swift
//  Collector
//
//  Created by Solid Omit on 2019-12-07.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import Foundation
import Core
import Images

extension RSImage {
	static let appIconImage: RSImage? = {
		#if os(macOS)
		return RSImage(named: NSImage.applicationIconName)
		#elseif os(iOS)
		
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return RSImage(named: lastIcon)
        }
		return nil
		#endif
	}()
}

extension IconImage {
	@MainActor static let appIcon: IconImage? = {
		if let image = RSImage.appIconImage {
			return IconImage(image)
		}
		return nil
	}()
}
