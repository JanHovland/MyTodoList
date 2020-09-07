//
//  ContentView.swift
//  MyTodoList
//
//  Created by Jan Hovland on 07/09/2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.title, ascending: true)]) var todos: FetchedResults<Todo>
    @State private var todoString: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Add a new Todo: ")
                    .foregroundColor(.blue)
                TextField("Add a Todo", text: $todoString) /// Add a Todo er placeholder
                Button(action: {
                    self.addTodo()
                }) {
                    Text("Save")
                }
            }
            .padding()
            List {
                ForEach(todos, id:\.self) { todo in
                    LazyHStack {
                    Text("\(todo.title ?? "")")
                        if todo.dateAdded != nil {
                            Text("\(todo.dateAdded!)")
                        }
                    }
                }
            }
        }
    }
    
    func addTodo() {
        let todo = Todo(context: context)
        todo.title = todoString
        todo.dateAdded = Date()
        do {
            try context.save()
            DispatchQueue.main.async {
                self.todoString = ""
            }
        }catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
