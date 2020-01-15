//
//  PostModel.swift
//  noodles
//
//  Created by Edgar Sgroi on 14/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

struct PostModel {
    var id: String
    var uniqueID: String
    var title: String
    var body: String
    var author: String
    var authorID: String
    var tags: [String]
    var readBy: [String]
    var validated: Bool
    var createdAt: Date
    var editedAt: Date
    var channels: [String]
}
