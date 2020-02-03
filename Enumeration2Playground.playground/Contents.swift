import UIKit
import Foundation

enum Permission: String {
    case write = "write"
    case read = "read"
}

enum User {
    case admin(name: String, permissions: [Permission])
    case regular(name: String, age: Int)
    case guest(anonymousId: Int)
}

var users: [User] = [
    .admin(name: "Abzal", permissions: [.read, .write]),
    .regular(name: "Askar", age: 20),
    .guest(anonymousId: 125),
    .guest(anonymousId: 156)
]

users.forEach {
    switch $0 {
    case .admin(let name, let permissions):
        print("This is admin with name: \(name) and permissions: \(permissions.map { $0.rawValue })")
    case .regular(let name, let age):
        print("This is regular user with name: \(name) and age: \(age)")
    case .guest(let anonymousId):
        print("This is guest with id: \(anonymousId)")
    }
}


var names: [String] = ["Abzal", "Askar", "Alina"]
var p = names.map { $0 + "+" }

print(names)
print(p)
print(names.map { name in return 1 })

var urlStrings: [String] = ["https://google.com", "mail.ru", "kdhfgkjdf"]
var urls = urlStrings.map { URL(string: $0) }
var urlsNotOptional = urlStrings.compactMap { return URL(string: $0) }

print(urlStrings)
print(urls)
print(urlsNotOptional)
