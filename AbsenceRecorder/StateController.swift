//
//  StateController.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 03/02/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var divisions: [Division]
    @Published var totalStudents = 46
    
    init() {
        divisions = Division.examples
    }
}
