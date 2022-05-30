extension Item {
    
    var isAgedBrie: Bool { isNamed("Aged Brie") }
    var isBackstagePasses: Bool { isNamed("Backstage passes to a TAFKAL80ETC concert") }
    var isSulfuras: Bool { isNamed("Sulfuras, Hand of Ragnaros") }
    
    private func isNamed(_ name: String) -> Bool {
        self.name == name
    }
    
}
