//
//  FilterModel.swift
//  ToDoNotes
//
//  Created by Roman Tverdokhleb on 1/4/25.
//

enum Filter: CaseIterable {
    case active
    case outdated
    case unsorted
    case completed
    case archived
    case deleted
    
    static internal var allCases: [Self] {
        [.active, .outdated, .completed, .archived, .deleted]
    }
    
    internal var name: String {
        switch self {
        case .active:
            return Texts.MainPage.Filter.active
        case .outdated:
            return Texts.MainPage.Filter.outdate
        case .unsorted:
            return Texts.MainPage.Filter.unsorted
        case .completed:
            return Texts.MainPage.Filter.completed
        case .archived:
            return Texts.MainPage.Filter.archived
        case .deleted:
            return Texts.MainPage.Filter.deleted
        }
    }
}
