//
//  CDProduct+CoreDataProperties.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//
//

import Foundation
import CoreData


extension CDProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDProduct> {
        return NSFetchRequest<CDProduct>(entityName: "CDProduct")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var isLiked: Bool
    @NSManaged public var productDescription: String?
    @NSManaged public var price: Int32
    @NSManaged public var stock: Int16
    @NSManaged public var imageUrl: String?
    @NSManaged public var brand: String?

    func convertToProduct() -> Product {
        return Product(title: self.title!, description: self.productDescription!, brand: self.brand!, thumbnail: self.imageUrl!, price: Int(self.price), stock: Int(self.stock), isLiked: self.isLiked,id: self.id)
    }
}
extension CDProduct : Identifiable {}
