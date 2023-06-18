//
//  MockData.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-16.
//

import Foundation

struct MockData {
    static let samplePizza1 = Pizza(imageName: "chicken_sizzler", name: "Chicken Sizzler", ingredients: "Green Chillies, Jalapeños, Red Onions, Chicken", thumbnailName: "thumbnail_chicken_sizzler", isFavorite: false, type: PizzaType(rawValue: PizzaType.Meat.rawValue)!)
    
    static let samplePizza2 = Pizza(imageName: "beef_sizzler", name: "Beef Sizzler", ingredients: "Green Chillies, Jalapeños, Red Onions, Seasoned Minced Beef", thumbnailName: "thumbnail_beef_sizzler", isFavorite: false, type: PizzaType(rawValue: PizzaType.Meat.rawValue)!)
    
    static let samplePizza3 = Pizza(imageName: "meat_feast", name: "Meat Feast", ingredients: "Green Chillies, Jalapeños, Red Onions, Chicken, Seasoned Minced Beef", thumbnailName: "thumbnail_meat_feast", isFavorite: false, type: PizzaType(rawValue: PizzaType.Meat.rawValue)!)
    
    static let samplePizza4 = Pizza(imageName: "veg_supreme", name: "Vegetable Supreme", ingredients: "Mushrooms, Mixed Peppers, Red Onions, Tomato", thumbnailName: "thumbnail_veg_supreme", isFavorite: false, type: PizzaType(rawValue: PizzaType.Veg.rawValue)!)
   
    static let samplePizza5 = Pizza(imageName: "veg_sizzler", name: "Veggie Sizzler", ingredients: "Green Chillies, Jalapeños, Mixed Peppers, Red Onions", thumbnailName: "thumbnail_veg_sizzler", isFavorite: false, type: PizzaType(rawValue: PizzaType.Meat.rawValue)!)
    
    static let samplePizzas = [
        MockData.samplePizza1,
        MockData.samplePizza2,
        MockData.samplePizza3,
        MockData.samplePizza4,
        MockData.samplePizza5
    ]
    
    static let meatPizzas = [
        MockData.samplePizza1,
        MockData.samplePizza2,
        MockData.samplePizza3
    ]
    
    static let vegPizzas = [
        MockData.samplePizza4,
        MockData.samplePizza5
    ]
    
    static func getMockData(_ type: String) -> [Pizza] {
        return type == PizzaType.Veg.rawValue ? vegPizzas : type == PizzaType.Meat.rawValue ? meatPizzas : samplePizzas
    }
}
