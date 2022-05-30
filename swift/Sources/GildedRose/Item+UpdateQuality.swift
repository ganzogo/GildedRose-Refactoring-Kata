extension Item {
    
    func updateQuality() {
        itemUpdater.update(item: self)
    }
    
    var itemUpdater: ItemUpdater {
        NormalItemUpdater()
    }
    
}
