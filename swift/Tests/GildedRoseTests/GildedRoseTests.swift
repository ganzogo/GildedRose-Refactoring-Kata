@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    /// At the end of each day our system lowers both values for every item
    func testValuesLoweredAfterOneDay() throws {
        
        assertUpdateQuality(
            name: "foo",
            initial: .init(sellIn: 1, quality: 1),
            expected: .init(sellIn: 0, quality: 0))
    }

    /// Once the sell by date has passed, Quality degrades twice as fast
    func testQualityDegradesTwiceAsFastWhenSellByDatePassed() throws {
        
        assertUpdateQuality(
            name: "foo",
            initial: .init(sellIn: 0, quality: 2),
            expected: .init(sellIn: -1, quality: 0))
    }

    /// The Quality of an item is never negative
    func testSellInCanBeNegativeButQualityCannot() throws {
        
        assertUpdateQuality(
            name: "foo",
            initial: .init(sellIn: 0, quality: 0),
            expected: .init(sellIn: -1, quality: 0))
    }
    
    /// "Aged Brie" actually increases in Quality the older it gets
    func testAgedBrieActuallyIncreasesInQualityTheOlderItGets() throws {
        
        assertUpdateQuality(
            name: "Aged Brie",
            initial: .init(sellIn: 1, quality: 0),
            expected: .init(sellIn: 0, quality: 1))
    }

    /// MVH: This isn't actually specified
    func testAgedBrieActuallyIncreasesInQualityTheOlderItGets_twiceAsFast() throws {
        
        assertUpdateQuality(
            name: "Aged Brie",
            initial: .init(sellIn: 0, quality: 0),
            expected: .init(sellIn: -1, quality: 2))
    }

    /// The Quality of an item is never more than 50
    func testTheQualityOfAnItemIsNeverMoreThan50() throws {
        
        assertUpdateQuality(
            name: "Aged Brie",
            initial: .init(sellIn: 1, quality: 50),
            expected: .init(sellIn: 0, quality: 50))
    }
    
    /// MVH: Cover behaviour when quality is already over 50 - this is possible for Sulfuras.
    
    /// "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
    func testSulfuras() throws {
        
        // MVH: Name is longer than just "Sulfuras"
        assertUpdateQuality(
            name: "Sulfuras, Hand of Ragnaros",
            initial: .init(sellIn: 1, quality: 1),
            expected: .init(sellIn: 1, quality: 1))
    }
    
    /// "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches
    func testBackstagePassesIncreaseInQuality() throws {
        
        assertUpdateQuality(
            name: "Backstage passes to a TAFKAL80ETC concert",
            initial: .init(sellIn: 11, quality: 1),
            expected: .init(sellIn: 10, quality: 2))
    }
    
    /// Quality increases by 2 when there are 10 days or less
    func testBackstagePassesIncreaseInQuality_10DaysOrLess() throws {
        
        assertUpdateQuality(
            name: "Backstage passes to a TAFKAL80ETC concert",
            initial: .init(sellIn: 10, quality: 1),
            expected: .init(sellIn: 9, quality: 3))
    }

    /// ...and by 3 when there are 5 days or less
    func testBackstagePassesIncreaseInQuality_5DaysOrLess() throws {

        assertUpdateQuality(
            name: "Backstage passes to a TAFKAL80ETC concert",
            initial: .init(sellIn: 5, quality: 1),
            expected: .init(sellIn: 4, quality: 4))
    }
    
    /// ...but Quality drops to 0 after the concert
    func testBackstagePassesIncreaseInQuality_afterTheConcert() throws {

        assertUpdateQuality(
            name: "Backstage passes to a TAFKAL80ETC concert",
            initial: .init(sellIn: 0, quality: 10),
            expected: .init(sellIn: -1, quality: 0))
    }
    
    /// "Conjured" items degrade in Quality twice as fast as normal items
    func testConjuredItemsDegradeInQualityTwiceAsFastAsNormalItems() throws {
        
        // TODO
    }
    
}

private extension GildedRoseTests {
    
    struct ItemState {
        let sellIn: Int
        let quality: Int
        
        init(sellIn: Int, quality: Int) {
            
            self.sellIn = sellIn
            self.quality = quality
        }
    }

    func assertUpdateQuality(name: String, initial: ItemState, expected: ItemState, file: StaticString = #file, line: UInt = #line) {
        
        let item = Item(name: name, sellIn: initial.sellIn, quality: initial.quality)
        let items = [item]
        
        let sut = GildedRose(items: items)
        sut.updateQuality()
        
        XCTAssertEqual(sut.items.count, 1, file: file, line: line)
        XCTAssertEqual(sut.items[0].name, name)
        XCTAssertEqual(sut.items[0].quality, expected.quality)
        XCTAssertEqual(sut.items[0].sellIn, expected.sellIn)
    }

}
