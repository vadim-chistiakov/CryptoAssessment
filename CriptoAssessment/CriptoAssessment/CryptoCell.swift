//
//  CryptoCell.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import SwiftUI

struct CryptoCell: View {
    var data: Currency

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/45_Bitcoin_logo_logos-512.png")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                //  как обновляться???
            } placeholder: {
                Color.green
            }
            .frame(width: 50, height: 50)
            Spacer()
            VStack {
                Text(data.data.name)
                Spacer()
                Text(data.data.symbol)
            }
        }
    }
}
