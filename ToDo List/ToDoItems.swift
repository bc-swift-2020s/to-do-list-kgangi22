//
//  ToDoItems.swift
//  ToDo List
//
//  Created by Kyle Gangi on 3/5/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import Foundation
import UserNotifications

class ToDoItems {
    var itemsArray: [ToDoItem] = []
    
    func saveData(){
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(itemsArray)
        do{
            try data?.write(to: documentURL, options: .noFileProtection)
        }catch {
            print("Error")
        }
        setNotifications()
    }
    
    func loadData(completed: @escaping () -> () ){
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("todos").appendingPathExtension("json")
        guard let data = try? Data(contentsOf: documentURL) else{return}
        let jsonDecoder = JSONDecoder()
        do{
            itemsArray = try jsonDecoder.decode(Array<ToDoItem>.self, from: data)
        } catch{
            print("Error")
        }
        completed()
        
    }
    
    func setNotifications() {
          guard itemsArray.count > 0 else{
              return
          }
          // remove all notifications
          UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
          
          // let's recreate them
          for index in 0..<itemsArray.count {
              if itemsArray[index].reminderSet{
                  let toDoItem = itemsArray[index]
                  itemsArray[index].notificationID = LocalNotificationManager.setCalendarNotification(title: itemsArray[index].name, subtitle: "", body: toDoItem.notes, badgeNumber: nil, sound: .default, date: toDoItem.date)
                  
                  
              }
          }
          
          
      }
    
    
    
}
