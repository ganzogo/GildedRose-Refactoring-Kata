extension Item {
    
    func updateQuality() {
        
        if !isAgedBrie && !isBackstagePasses {
            if quality > 0 {
                if !isSulfuras {
                    quality = quality - 1
                }
            }
        } else {
            if quality < 50 {
                quality = quality + 1
                
                if isBackstagePasses {
                    if sellIn < 11 {
                        if quality < 50 {
                            quality = quality + 1
                        }
                    }
                    
                    if sellIn < 6 {
                        if quality < 50 {
                            quality = quality + 1
                        }
                    }
                }
            }
        }
        
        if !isSulfuras {
            sellIn = sellIn - 1
        }
        
        if sellIn < 0 {
            if !isAgedBrie {
                if !isBackstagePasses {
                    if quality > 0 {
                        if !isSulfuras {
                            quality = quality - 1
                        }
                    }
                } else {
                    quality = quality - quality
                }
            } else {
                if quality < 50 {
                    quality = quality + 1
                }
            }
        }
    }
    
}
