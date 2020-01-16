//
//  ChannelModel.swift
//  noodles
//
//  Created by Edgar Sgroi on 14/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

struct ChannelModel {
    var id: String
    var posts: [PostModel]
    var cratedBy: UserModel
    var canBeEditedBy: [RankModel]
    var canBeViewedBy: [RankModel]
    var createdAt: Date
    var editedAt: Date
}
