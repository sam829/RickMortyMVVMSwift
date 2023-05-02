//
//  DataEvent.swift
//  RickMortyDemo
//
//  Created by Saumya Macwan on 02/05/23.
//

import Foundation

enum DataEvent {
    case loading
    case finishLoading
    case dataLoaded
    case error(Error?)
}
