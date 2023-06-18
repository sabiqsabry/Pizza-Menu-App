//
//  NetworkStore.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-06.
//

import Foundation

final class NetworkStore: ObservableObject {
    @Published var pizzas: [Pizza] = []
    
    static let shared = NetworkStore()
    
    private init() {
        loadJSON()
    }
    
    func loadJSON() {
        print("Loading JSON")
        guard let url = Bundle.main.url(forResource: "PizzaResources/pizzas", withExtension: "json") else {
            print("Could not fetch json file")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            pizzas = try JSONDecoder().decode([Pizza].self, from: data)
            print("Pizzas from JSON: \(pizzas)")
        } catch {
            print(error)
        }
    }
    
    func getPizzas(forType type: PizzaType?) -> [Pizza] {
        guard let type = type else { return pizzas }
        return pizzas.filter { pizza in
            pizza.type == type
        }
    }
}
