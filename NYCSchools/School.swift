//
//  School.swift
//  NYCSchools
//
//  Created by Shraboni on 3/18/22.
//

import Foundation

struct School: Codable {
    let name: String
    let readingScore:String
    let writingScore:String
    let mathScore:String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case readingScore = "sat_critical_reading_avg_score"
        case writingScore = "sat_math_avg_score"
        case mathScore = "sat_writing_avg_score"
    }
}

struct SchoolDescriptoion: Codable {
    let dbn: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case description = "overview_paragraph"
    }
}
