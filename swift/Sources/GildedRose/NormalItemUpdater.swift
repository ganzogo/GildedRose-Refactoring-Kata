class NormalItemUpdater: ItemUpdater {
    
    func calculateNewSellInValue(for item: Item) -> Int {
        item.isSulfuras ? item.sellIn : item.sellIn - 1
    }
    
    func calculateNewQualityInValue(for item: Item) -> Int {
        
        var newQuality = item.quality
        
        if !item.isAgedBrie && !item.isBackstagePasses {
            if !item.isSulfuras {
                newQuality = newQuality - 1
            }
        } else {
            newQuality = newQuality + 1
            
            if item.isBackstagePasses {
                if item.sellIn < 10 {
                    newQuality = newQuality + 1
                }
                
                if item.sellIn < 5 {
                    newQuality = newQuality + 1
                }
            }
        }
        
        if item.isPastSellByDate {
            if !item.isAgedBrie {
                if !item.isBackstagePasses {
                    if !item.isSulfuras {
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
