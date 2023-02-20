// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let items = try Items(json)

import Foundation

// MARK: - Items
struct Items: BaseModel,Codable {
    let status:String
    let error: String?
    let data: ItemsList
}

// MARK: Items convenience initializers and mutators

extension Items {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Items.self, from: data)
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
        status: String? = nil,
        error: String? = nil,
        data: ItemsList? = nil
    ) -> Items {
        return Items(
            status: status ?? self.status,
            error: error ?? self.error,
            data: data ?? self.data
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}



