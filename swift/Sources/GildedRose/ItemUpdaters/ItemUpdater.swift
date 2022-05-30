protocol ItemUpdater {
    func calculateNewSellInValue(for item: Item) -> Int
    func calculateNewQualityInValue(for item: Item) -> Int
}

extension ItemUpdater {

    func update(item: Item) {
        
        item.sellIn = calculateNewSellInValue(for: item)
        item.quality = calculateNewQualityInValue(for: item)
            .clamping(min: 0, max: 50)
    }

}
