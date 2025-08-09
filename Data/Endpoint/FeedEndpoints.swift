//
//  FeedEndpoints.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import Core

public enum FeedEndpoints {
    /// GET /v2/list?page={page}&limit={limit}
    public static func feeds(page: Int, limit: Int) -> Endpoint {
        Endpoint(
            path: "v2/list?page=\(page)&limit=\(limit)",
            method: .get
        )
    }
}
