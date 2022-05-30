extension Item {
    
    func updateQuality() {
    
        sellIn = calculateNewSellInValue()
        quality = calculateNewQualityValue()
            .clamping(min: 0, max: 50)
    }
    
    private func calculateNewSellInValue() -> Int {
        isSulfuras ? sellIn : sellIn - 1
    }
    
    private func calculateNewQualityValue() -> Int {
        
        var newQuality = quality
        
        if !isAgedBrie && !isBackstagePasses {
            if !isSulfuras {
                newQuality = newQuality - 1
            }
        } else {
            newQuality = newQuality + 1
            
            if isBackstagePasses {
                if sellIn < 10 {
                    newQuality = newQuality + 1
                }
                
                if sellIn < 5 {
                    newQuality = newQuality + 1
                }
            }
        }
        
        if isPastSellByDate {
            if !isAgedBrie {
                if !isBackstagePasses {
                    if !isSulfuras {
                        return newQuality - 1
                    }
                } else {
                    return 0
                }
            } else {
                return newQuality + 1
            }
        }
        
        return newQuality
    }
    
}
