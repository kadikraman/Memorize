//
//  Array+Only.swift
//  Memorize
//
//  Created by Kadi Kraman on 13/02/2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
