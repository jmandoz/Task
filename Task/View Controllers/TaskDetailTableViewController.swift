//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDueDateTextField: UITextField!
    
    @IBOutlet weak var taskNotesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    private func updateTask() {
        guard let name = taskNameTextField.text else {return}
        let due = dueDateValue
        guard let notes = taskNotesTextView.text else {return}
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        
    }
    
    private func updateViews() {
        guard let task = task, isViewLoaded else {return}

        title = task.name
        taskNameTextField.text = task.name
        taskDueDateTextField.text = (task.due as Date?)?.stringValue()
        taskNotesTextView.text = task.notes
    }
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?
    
    
    
    
}
