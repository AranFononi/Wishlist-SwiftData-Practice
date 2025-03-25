//
//  WishModel.swift
//  Wish List
//
//  Created by Aran Fononi on 26/3/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
