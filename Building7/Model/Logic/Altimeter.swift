//
//  Altimeter.swift
//  Building7
//
//  Created by cmStudent on 2021/08/19.
//

import Foundation
import CoreMotion

class Altimeter {
    
    // MARK: - Private Properties
    /// 高度計
    private var altimeter: CMAltimeter!
    
    
    // MARK: - Initializer
    init() {
        altimeter = CMAltimeter()
    }
    
    // MARK: - Funcs
    func getPressure(completion: @escaping (Double) -> Void) {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: .main) { data, error in
                if let error = error {
                    print("error: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                self.altimeter.stopRelativeAltitudeUpdates()
                
                let pressure = Double(truncating: data.pressure) * 10
                completion(pressure)
            }
        }
    }
    
}
