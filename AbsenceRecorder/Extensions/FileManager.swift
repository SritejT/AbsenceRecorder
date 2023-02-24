//
//  FileManager.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 24/02/2023.
//

import Foundation

extension FileManager {
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save<T: Codable>(to filePath: String, object: T) {
        let encoder = JSONEncoder()
        if let encoded =  try? encoder.encode(object) {
            // take encoded objects and convert into string
            if let json = String(data: encoded, encoding: .utf8) {
                // create file path
                let url = getDocumentDirectory().appendingPathComponent(filePath)
                // write json string to file
                do {
                    try json.write(to: url, atomically: true, encoding: .utf8)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func load<T: Codable>(from filePath: String) -> T? {
        let url = getDocumentDirectory().appendingPathComponent(filePath)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(T.self, from: data) {
                return loaded
            } else {
                print("Failed to decode.")
                return nil
            }
        } else {
            print("Couldn't find file at given path.")
            return nil
        }
    }
}
