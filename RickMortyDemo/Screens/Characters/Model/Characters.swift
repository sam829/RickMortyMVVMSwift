//
//  Characters.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 01/05/23.
//
import Foundation

// MARK: - Character
struct Character: Codable {
    let info: Info
    let results: [CharacterResult]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct CharacterResult: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Gender
enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location, Origin
struct Location: Codable {
    let name: String
    let url: String
}

// MARK: - Species
enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

// MARK: - Status
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
