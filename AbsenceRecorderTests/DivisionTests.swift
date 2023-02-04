//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by Ravindra Tummuru on 03/02/2023.
//

import XCTest

@testable import AbsenceRecorder

class DivisionTests: XCTestCase {


    func testGetAbsenceDivisionWithAbsenceOnThatDayReturnsAbsence() throws {
        let division = Division(code: "TestDiv")
        let dateToday = Date()
        let dateTomorrow = Date(timeIntervalSinceNow: 1000000000000000000000)
        let dateLaterToday = Date(timeIntervalSinceNow: 100)
        let absence1 = Absence(date: dateTomorrow, students: Student.examples)
        let absence2 = Absence(date: dateToday, students: Student.examples)
        division.absences.append(absence1)
        division.absences.append(absence2)
        
        let actual = division.getAbsence(for: dateLaterToday)
        
        XCTAssertNotNil(actual)
        
        if let actualNotNil = actual {
            XCTAssertEqual(actualNotNil.takenOn, absence2.takenOn)
        }
        
    }
    
    func testWhenGetExistingAbsenceReturnsExistingAbsence() {
        let division = Division(code: "TestDiv")
        let dateToday = Date()
        let dateLaterToday = Date(timeIntervalSinceNow: 1)
        let absence1 = division.createAbsenceOrGetExistingIfAvailable(for: dateToday)
        
        XCTAssertEqual(division.absences.count, 1)
        
        let absence2 = division.createAbsenceOrGetExistingIfAvailable(for: dateLaterToday)
        
        XCTAssertEqual(division.absences.count, 1)
        XCTAssertEqual(absence1.takenOn, absence2.takenOn)
    }


}
