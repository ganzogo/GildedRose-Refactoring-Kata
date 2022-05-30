class NormalItemUpdater: ItemUpdater {
    
    func calculateNewSellInValue(for item: Item) -> Int {
        item.sellIn - 1
    }
    
    func calculateNewQualityInValue(for item: Item) -> Int {
        item.quality - (item.isPastSellByDate ? 2 : 1)
    }

}
