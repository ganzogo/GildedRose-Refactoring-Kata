class BackstagePassesItemUpdater: NormalItemUpdater {

    override func calculateNewQualityInValue(for item: Item) -> Int {
        
        if item.isPastSellByDate {
           return 0
        }

        if item.sellIn >= 10 {
            return item.quality + 1
        }

        if item.sellIn > 5 {
            return item.quality + 2
        }

        return item.quality + 3
    }

}
