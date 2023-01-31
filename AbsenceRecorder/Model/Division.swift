//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 21/01/2023.
//

import Foundation

class Division {

    let code: String
    var students: [Student] = []
    
    init(code: String) {
        self.code = code
    }
    
    #if DEBUG
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for i in 0..<size {
            division.students.append(Student(forename: "\(i)", surname: "\(i)", birthday: Date()))
        }
        return division
    }
    
    static let examples = [Division.createDivision(code: "Class 1", of: 8),
                           Division.createDivision(code: "Class 2", of: 12),
                           Division.createDivision(code: "Class 3", of: 20),
                           Division.createDivision(code: "Class 4", of: 6),
                          ]
    #endif

}
