//
//  ShoppingList.swift
//  ShoppingCheckList
//
//  Created by  Prince Shrivastav on 28/09/24.
//

import Foundation

struct ShoppingList: Codable {
    let shoppingData: ShoppingData?
}

struct ShoppingData: Codable {
    let contentFeed: ContentFeed?
}

struct ContentFeed: Codable {
    let feedName: String?
    let feedResults: [FeedResults]?
}

struct FeedResults: Codable {
    let id: Int?
    let tags: [String]?
    let artifact: Artifact?
}

struct Artifact: Codable {
    let id: Int?
    let contentPage: ContentPage?
    let slideShow: SlideShow?
}

struct ContentPage: Codable {
    let id: Int?
    let title: String?
    let bodyDisplay: String?
    let brandedContentSponsor: String?
    let brandedContentSponsorImg: String?
    let brandedContentSponsorUrl: String?
    let active: Bool?
    let urlMappings: [UrlMappings]?
}

struct UrlMappings: Codable {
    let incomingUrl: String?
}

struct SlideShow: Codable {
    let id: Int?
    let type: String?
    let slides: [Slides]?
}

struct Slides: Codable {
    let id: Int?
    let headline: String?
    let shortName: String?
    let caption: String?
    let order: Int?
    let imageUrl: String?
    let imageAltText: String?
    let photoCredit: String?
    let retailers: [Retailers]?
}

struct Retailers: Codable {
    let productId: String?
    let productLink: String?
}
