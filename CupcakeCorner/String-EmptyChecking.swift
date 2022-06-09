//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Yuri Gerasimchuk on 09.06.2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
