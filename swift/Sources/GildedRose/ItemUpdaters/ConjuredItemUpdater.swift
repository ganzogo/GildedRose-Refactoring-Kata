class ConjuredItemUpdater: NormalItemUpdater {

    override func calculateNewQualityInValue(for item: Item) -> Int {
        item.quality - (item.isPastSellByDate ? 4 : 2)
    }

}
