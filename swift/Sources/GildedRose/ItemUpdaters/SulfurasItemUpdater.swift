class SulfurasItemUpdater: ItemUpdater {
    
    func calculateNewSellInValue(for item: Item) -> Int {
        item.sellIn
    }
    
    func calculateNewQualityInValue(for item: Item) -> Int {
        item.quality
    }

}
