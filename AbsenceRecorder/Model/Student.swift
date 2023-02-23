//
//  Student.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 21/01/2023.
//

import Foundation

class Student: Codable {
    let forename: String
    let surname: String
    let birthday: Date
    
    init(forename: String, surname: String, birthday: Date) {
        self.forename = forename
        self.surname = surname
        self.birthday = birthday
    }
    
    #if DEBUG
    static let example = Student(forename: "Roberto", surname: "Baggio", birthday: Date())
    static let examples = [example]
    #endif
}
