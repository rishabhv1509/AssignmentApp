// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let store = try StoreResponseModel(json)

import Foundation

// MARK: - StoreResponseModel
struct StoreResponseModel: BaseModel,Codable {
    let status:String
    let error: String?
    let data: ItemsList
}

// MARK: StoreResponseModel convenience initializers and mutators

extension StoreResponseModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(StoreResponseModel.self, from: data)
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
    ) -> StoreResponseModel {
        return StoreResponseModel(
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



