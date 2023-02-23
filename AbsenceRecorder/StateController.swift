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
    
    func getFilePath(fileName: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let userPath = paths[0]
        let url = userPath.appendingPathComponent(fileName)
        return url
    }
    
    func loadFromFile() {
        let url = getFilePath(fileName: "divisions.json")
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode([Division].self, from: data) {
                divisions = loaded
            }
        }
        
    }
    
    func saveToFile() {
        // create json encoder
        let encoder = JSONEncoder()
        if let encoded =  try? encoder.encode(divisions) {
            // take encoded objects and convert into string
            if let json = String(data: encoded, encoding: .utf8) {
                // create file path
                let url = getFilePath(fileName: "divisions.json")
                // write json string to file
                do {
                    try json.write(to: url, atomically: true, encoding: .utf8)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
