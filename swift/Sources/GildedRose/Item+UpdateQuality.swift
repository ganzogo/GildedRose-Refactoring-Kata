extension Item {
    
    func updateQuality() {
        
        performQualityUpdate()
        quality = quality.clamping(min: 0, max: 50)
    }
    
    private func performQualityUpdate() {
        
        if !isSulfuras {
            sellIn = sellIn - 1
        }
        
        if !isAgedBrie && !isBackstagePasses {
            if !isSulfuras {
                quality = quality - 1
            }
        } else {
            quality = quality + 1
            
            if isBackstagePasses {
                if sellIn < 10 {
                    quality = quality + 1
                }
                
                if sellIn < 5 {
                    quality = quality + 1
                }
            }
        }
        
        if sellIn < 0 {
            if !isAgedBrie {
                if !isBackstagePasses {
                    if !isSulfuras {
                        quality = quality - 1
                    }
                } else {
                    quality = quality - quality
                }
            } else {
                quality = quality + 1
            }
        }
    }
    
}
