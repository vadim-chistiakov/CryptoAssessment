//
//  SwiftUIView.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import SwiftUI

struct CryptoTableView: View {
    @ObservedObject var viewModel: CryptoViewModel

    var body: some View {
        List {
            ForEach(viewModel.currencies) { currency in
                CryptoCell(data: currency)
            }
        }
    }
}

struct CryptoTableView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoTableView(
            viewModel: CryptoViewModel(
                apiService: APIServiceImpl()
            )
        )
    }
}
