//
//  AddPizzaView.swift
//  Pizza
//
//  Created by Sabiq on 2023-03-10.
//

import SwiftUI

struct AddPizzaView: View {
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var name = ""
    @State private var imageName = ""
    @State private var thumbnaiName = ""
    @State private var ingredients = ""
    @State private var type = PizzaType.Meat.rawValue
    @State private var isFavorite = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("Pizza name")
                }
                Section {
                    TextEditor(text: $ingredients)
                        .frame(height: 200)
                } header: {
                    Text("Ingredients")
                }
                Section {
                    TextField("Image name", text: $imageName)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    TextField("Thumbnail name", text: $thumbnaiName)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                } header: {
                    Text("Images")
                }
                Picker("Type", selection: $type) {
                    Text("🥩 Meat").tag(PizzaType.Meat.rawValue)
                    Text("🥗 Veg").tag(PizzaType.Veg.rawValue)
                }
                Toggle("Favorite", isOn: $isFavorite)
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        viewModel.addPizzaData(name: name,
                                               ingredients: ingredients,
                                               imageName: imageName,
                                               thumbnailName: thumbnaiName,
                                               type: PizzaType.init(rawValue: type) ?? PizzaType.Meat,
                                               isFavorite: isFavorite)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaView(viewModel: PizzaViewModel())
    }
}
