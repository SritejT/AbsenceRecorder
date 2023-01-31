//
//  DivisionItem.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 31/01/2023.
//

import SwiftUI

struct DivisionItem: View {
    let division: Division
    var body: some View {
        HStack {
            Image(systemName: "\(division.students.count).circle")
            Text("\(division.code)")
        }
    }
}

struct DivisionItem_Previews: PreviewProvider {
    static var previews: some View {
        DivisionItem(division: Division(code: "vBY-1"))
    }
}
