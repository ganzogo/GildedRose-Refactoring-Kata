public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality);
    }
}

extension Item {
    
    enum ItemType {
        case normal
        case agedBrie
        case backstagePasses
        case sulfuras
    }
    
    var itemType: ItemType {
        
        if isAgedBrie {
            return .agedBrie
        }
        
        if isBackstagePasses {
            return .backstagePasses
        }
        
        if isSulfuras {
            return .sulfuras
        }
        
        return .normal
    }
    
    var isAgedBrie: Bool { isNamed("Aged Brie") }
    var isBackstagePasses: Bool { isNamed("Backstage passes to a TAFKAL80ETC concert") }
    var isSulfuras: Bool { isNamed("Sulfuras, Hand of Ragnaros") }
    
    private func isNamed(_ name: String) -> Bool {
        self.name == name
    }
    
}

extension Item {

    func updateQuality() {
        itemType.itemUpdater.update(item: self)
    }
    
    var isPastSellByDate: Bool {
        sellIn < 0
    }

}

extension Item.ItemType {
    
    var itemUpdater: ItemUpdater {
        
        switch self {
        case .normal:
            return NormalItemUpdater()
            
        case .sulfuras:
            return SulfurasItemUpdater()
            
        case .backstagePasses:
            return BackstagePassesItemUpdater()
            
        case .agedBrie:
            return AgedBrieItemUpdater()
        }
    }

}
