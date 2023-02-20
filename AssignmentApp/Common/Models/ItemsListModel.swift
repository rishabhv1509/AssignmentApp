//
//  ItemsListModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 17/02/23.
//

import Foundation

// MARK: - ItemsList
struct ItemsList:BaseModel ,Codable {
    let items: [Item]
}

// MARK: DataClass convenience initializers and mutators

extension ItemsList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ItemsList.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        items: [Item]? = nil
    ) -> ItemsList {
        return ItemsList(
            items: items ?? self.items
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
