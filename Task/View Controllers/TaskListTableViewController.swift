//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.shared.tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ButtonTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell
        if cell == nil { cell = ButtonTableViewCell() }
        let task = TaskController.shared.tasks[indexPath.row]
        
        cell.update(withTask: task)
//        cell.delegate = self
        return cell
    }
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        let task = TaskController.shared.tasks[indexPath.row]
        TaskController.shared.toggleIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let task = TaskController.shared.tasks[indexPath.row]
            
            let destinationVC = segue.destination as? TaskDetailTableViewController
            
            destinationVC?.task = task
            
            destinationVC?.dueDateValue = task.due as? Date
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        
    }
}
