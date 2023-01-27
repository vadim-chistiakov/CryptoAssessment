//
//  CriptoAssessmentApp.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import SwiftUI

@main
struct CriptoAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoTableView(
                viewModel: CryptoViewModel(
                    apiService: APIServiceImpl()
                )
            )
        }
    }
}
