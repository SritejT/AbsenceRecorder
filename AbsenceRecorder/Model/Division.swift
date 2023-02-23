//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 21/01/2023.
//

import Foundation

class Division: Codable {

    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first {
            let comparison = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparison == .orderedSame
        }
    }
    
    func createAbsenceOrGetExistingIfAvailable(for date: Date) -> Absence {
        if getAbsence(for: date) == nil {
            let newAbsence = Absence(date: date, students: students)
            absences.append(newAbsence)
            return newAbsence
        } else {
            return getAbsence(for: date)!
        }
    }
    #if DEBUG
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for i in 0..<size {
            division.students.append(Student(forename: "Student\(i)", surname: "\(i)", birthday: Date()))
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
