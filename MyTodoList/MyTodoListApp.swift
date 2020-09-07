//
//  MyTodoListApp.swift
//  MyTodoList
//
//  Created by Jan Hovland on 07/09/2020.
//

import SwiftUI

@main
struct MyTodoList: App {
    let context = DataStore.shared.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}

