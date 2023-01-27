//
//  Currency.swift
//  CriptoAssessment
//
//  Created by Vadim Chistiakov on 27.01.2023.
//

import Foundation

// MARK: - Currency
struct Currency: Decodable {
    let status: Status
    let data: CurrencyData
}

extension Currency: Identifiable {
    var id: String {
        UUID().uuidString
    }
}

// MARK: - CurrencyData
struct CurrencyData: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case serialId = "serial_id"
        case id, symbol, name, slug, contractAddresses
    }
    
    let id: String
    let serialId: Int
    let symbol, name, slug: String
    let contractAddresses: Int?
//    let marketData: MarketData
//    let marketcap: Marketcap
//    let supply: Supply
//    let blockchainStats24_Hours: [String: Double?]
//    let marketDataLiquidity: MarketDataLiquidity
//    let allTimeHigh: AllTimeHigh
//    let cycleLow: CycleLow
//    let tokenSaleStats: TokenSaleStats
//    let miningStats: MiningStats
//    let developerActivity: DeveloperActivity
//    let roiData, roiByYear: [String: Double]
//    let riskMetrics: RiskMetrics
//    let miscData: MiscData
//    let reddit: Reddit
//    let onChainData: [String: Double?]
//    let exchangeFlows: [String: Double]
//    let minerFlows: MinerFlows
//    let supplyActivity: [String: Double]
//    let supplyDistribution: [String: Double?]
//    let alertMessages: String?
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Decodable {
    let price: Double
    let at: Date
    let daysSince: Int
    let percentDown, breakevenMultiple: Double
}

// MARK: - CycleLow
struct CycleLow: Decodable {
    let price: Double
    let at: Date
    let percentUp: Double
    let daysSince: Int
}

// MARK: - DeveloperActivity
struct DeveloperActivity: Decodable {
    let stars, watchers: Int
    let commitsLast3_Months, commitsLast1_Year, linesAddedLast3_Months, linesAddedLast1_Year: Int?
    let linesDeletedLast3_Months, linesDeletedLast1_Year: Int?
}

// MARK: - MarketData
struct MarketData: Decodable {
    let priceUsd: Double
    let priceBtc: Int
    let priceEth, volumeLast24_Hours, realVolumeLast24_Hours, volumeLast24_HoursOverstatementMultiple: Double
    let percentChangeUsdLast1_Hour: Double
    let percentChangeBtcLast1_Hour: Int
    let percentChangeEthLast1_Hour, percentChangeUsdLast24_Hours, percentChangeBtcLast24_Hours, percentChangeEthLast24_Hours: Double
    let ohlcvLast1_Hour, ohlcvLast24_Hour: OhlcvLastHour
    let lastTradeAt: Date
}

// MARK: - OhlcvLastHour
struct OhlcvLastHour: Decodable {
    let ohlcvLastHourOpen, high, low, close: Double
    let volume: Double
}

// MARK: - MarketDataLiquidity
struct MarketDataLiquidity: Decodable {
    let clearingPricesToSell, marketcap, assetBidDepth, usdBidDepth: Int?
    let updatedAt: Date
}

// MARK: - Marketcap
struct Marketcap: Decodable {
    let rank: Int
    let marketcapDominancePercent, currentMarketcapUsd, y2050_MarketcapUsd, yPlus10MarketcapUsd: Double
    let liquidMarketcapUsd, volumeTurnoverLast24_HoursPercent, realizedMarketcapUsd, outstandingMarketcapUsd: Double
}

// MARK: - MinerFlows
struct MinerFlows: Decodable {
    let supply1HopMinersUsd, supply1HopMinersNativeUnits, supplyMinersUsd, supplyMinersNativeUnits: Double
}

// MARK: - MiningStats
struct MiningStats: Decodable {
    let miningAlgo, networkHashRate: String
    let availableOnNicehashPercent: Double
    let the1_HourAttackCost, the24_HoursAttackCost, attackAppeal: Int?
    let hashRate, hashRate30DAverage, miningRevenuePerHashUsd, miningRevenuePerHashNativeUnits: Double
    let miningRevenuePerHashPerSecondUsd, miningRevenuePerHashPerSecondNativeUnits, miningRevenueFromFeesPercentLast24_Hours, miningRevenueNative: Double
    let miningRevenueUsd, miningRevenueTotal, averageDifficulty: Double
}

// MARK: - MiscData
struct MiscData: Decodable {
    let privateMarketPriceUsd, vladimirClubCost, btcCurrentNormalizedSupplyPriceUsd, btcY2050NormalizedSupplyPriceUsd: Int?
    let assetCreatedAt, assetAgeDays: Int?
    let categories, sectors: [String]
    let tags: Int?
}

// MARK: - Reddit
struct Reddit: Decodable {
    let activeUserCount, subscribers: Int
}

// MARK: - RiskMetrics
struct RiskMetrics: Decodable {
    let sharpeRatios: SharpeRatios
    let volatilityStats: VolatilityStats
}

// MARK: - SharpeRatios
struct SharpeRatios: Decodable {
    let last30_Days, last90_Days, last1_Year, last3_Years: Double
}

// MARK: - VolatilityStats
struct VolatilityStats: Decodable {
    let volatilityLast30_Days, volatilityLast90_Days, volatilityLast1_Year, volatilityLast3_Years: Double
}

// MARK: - Supply
struct Supply: Decodable {
    let y2050, yPlus10, liquid: Double
    let circulating: Int
    let y2050_IssuedPercent, annualInflationPercent, stockToFlow, yPlus10IssuedPercent: Double
    let supplyRevived90D: Double
}

// MARK: - TokenSaleStats
struct TokenSaleStats: Decodable {
    let saleProceedsUsd, saleStartDate, saleEndDate, roiSinceSaleUsdPercent: Int?
    let roiSinceSaleBtcPercent, roiSinceSaleEthPercent: Int?
}

// MARK: - Status
struct Status: Decodable {
    let elapsed: Int
    let timestamp: String
}
