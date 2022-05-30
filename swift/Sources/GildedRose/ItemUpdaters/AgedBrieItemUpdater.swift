class AgedBrieItemUpdater: NormalItemUpdater {

    override func calculateNewQualityInValue(for item: Item) -> Int {
        item.quality + (item.isPastSellByDate ? 2 : 1)
    }

}
