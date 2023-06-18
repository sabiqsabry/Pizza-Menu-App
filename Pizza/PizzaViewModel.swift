//
//  PizzaViewModel.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-10.
//

import Foundation
import CoreData

final class PizzaViewModel: ObservableObject {
    @Published var savedPizzas: [PizzaEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading data \(error)")
            } else {
                print("Successfully loaded core data")
            }
        }
        
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<PizzaEntity>(entityName: "PizzaEntity")
        do {
            savedPizzas = try container.viewContext.fetch(request)
            print("Pizzas from data model \(savedPizzas)")
        } catch let error {
            print("Invalid Request \(error)")
            
        }
    }

    func addPizzaData(name: String, ingredients: String, imageName: String, thumbnailName: String, type: PizzaType, isFavorite: Bool) {
        let newPizza = PizzaEntity(context: container.viewContext)
        newPizza.name = name
        newPizza.ingredients = ingredients
        newPizza.imageName = imageName
        newPizza.thumbnailName = thumbnailName
        newPizza.type = type.rawValue
        newPizza.isFavorite = isFavorite
        saveData()
    }

    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error saving data \(error)")
        }
    }
    
    func filterByType(type pizzaType: String) -> [PizzaEntity] {
        if pizzaType == "all" {
            return savedPizzas
        }
        
        return savedPizzas.filter { pizza in
            pizza.type == pizzaType
        }
    }
}
