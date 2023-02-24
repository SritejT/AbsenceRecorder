//
//  StateController.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 03/02/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var divisions: [Division] = []
    @Published var totalStudents = 46
    
    init() {
        loadFromFile()
    }
    
    func loadFromFile() {
        if let loaded: [Division] = FileManager.default.load(from: "divisions.json") {
            divisions = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "divisions.json", object: divisions)
    }
}
