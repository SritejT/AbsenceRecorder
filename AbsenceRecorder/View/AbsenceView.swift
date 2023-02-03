//
//  AbsenceView.swift
//  AbsenceRecorder
//
//  Created by Ravindra Tummuru on 03/02/2023.
//

import SwiftUI

struct AbsenceView: View {
    let division: Division

    var body: some View {
        Text("Absence View - \(division.code)")
    }
}

struct AbsenceView_Previews: PreviewProvider {
    static var previews: some View {
        AbsenceView(division: Division.examples[0])
    }
}
