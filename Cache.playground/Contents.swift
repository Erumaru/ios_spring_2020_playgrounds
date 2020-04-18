import UIKit

// Caching

// User Defaults
UserDefaults.standard

// setting data
UserDefaults.standard.set(50, forKey: "some_key")
UserDefaults.standard.set([1, 2, 3], forKey: "some_array")

// getting data
UserDefaults.standard.double(forKey: "some_key")
UserDefaults.standard.array(forKey: "some_array")

// forcing synchronization
UserDefaults.standard.synchronize()

// Info.plist and Bundle
Bundle.main.path(forResource: "info", ofType: "plist")

// Codable and NSCoding
class Person: Codable {
    var name: String
    var age: Int
    var birth: Date
    var pet: Pet
    
    enum CodingKeys: String, CodingKey {
        case name = "first_name"
        case age // same as: case age = age
        case birth
        case pet
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(birth, forKey: .birth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.birth = try container.decode(Date.self, forKey: .birth)
        self.pet = try container.decodeIfPresent(Pet.self, forKey: .pet) ?? Pet(name: "Sharik")
    }
    
    init(name: String, age: Int, birth: Date) {
        self.name = name
        self.age = age
        self.birth = birth
        self.pet = Pet(name: "Sharik")
    }
}

class Pet: Codable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// Encoding
let person = Person(name: "Abzal", age: 24, birth: .init(timeIntervalSince1970: 31231))
let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601

let data = try? encoder.encode(person)

// Decoding
do {
    let decoder = JSONDecoder()
    let decodedPerson = try decoder.decode(Person.self, from: data!)
} catch DecodingError.dataCorrupted(let context) {
    print(context)
} catch {
    print(error)
}

// File system
FileManager.SearchPathDirectory.applicationDirectory // read only
FileManager.SearchPathDirectory.documentDirectory // read/write user can see
FileManager.SearchPathDirectory.applicationSupportDirectory // read/write user can't see
FileManager.SearchPathDirectory.cachesDirectory // temp caches

// Get url to some directory
let url: URL = try! FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: true)
// Check
url.isFileURL

// Retrieve data from url
let myImageURL = url.appendingPathComponent("some.png")
let someURL = url.appendingPathComponent("some2.png")

if FileManager.default.fileExists(atPath: myImageURL.path) {
    let data = FileManager.default.contents(atPath: myImageURL.path)
    try? data?.write(to: someURL)
}

try? FileManager.default.moveItem(at: myImageURL, to: someURL)
try? FileManager.default.removeItem(at: myImageURL)

// Thread safe

import CoreData
import CloudKit
import SQLite3

// Keychain
// UIDocument
