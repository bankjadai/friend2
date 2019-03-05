import UIKit

class ChecklistViewController : UITableViewController,AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
         navigationController?.popViewController(animated:true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinisAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
         navigationController?.popViewController(animated:true)
    }
    
    var items = [ChecklistItem]()
    
    //    let row0text = "Walk the dog."
    //    let row1text = "Brush my teeth"
    //    let row2text = "Learn iOS development"
    //    let row3text = "Soccer practice"
    //    let row4text = "Eat ice cream"
    //
    //    var row0checked = false
    //    var row1checked = false
    //    var row2checked = false
    //    var row3checked = false
    //    var row4checked = false
    //
    //    var row0item = ChecklistItem()
    //    var row1item = ChecklistItem()
    //    var row2item = ChecklistItem()
    //    var row3item = ChecklistItem()
    //    var row4item = ChecklistItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add the following lines
        navigationController?.navigationBar.prefersLargeTitles = true
        let item1 = ChecklistItem()
        item1.text = "Walk the dog."
        item1.checked = true
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        item4.checked = true
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        item5.checked = true
        items.append(item5)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //    MARK: data soure protocol.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        let item = items[indexPath.row]
        
        
        label.text = item.text
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
        
        //        if indexPath.row == 0 {
        //            label.text = row0item.text
        //        }else if indexPath.row == 1 {
        //            label.text = row1item.text
        //        }else if indexPath.row == 2 {
        //            label.text = row2item.text
        //        }else if indexPath.row == 3 {
        //            label.text = row3item.text
        //        }else if indexPath.row == 4 {
        //            label.text = row4item.text
        //        }
        //        configureCheckmark(for: cell, at: indexPath)
        //        return cell
    }
    
    //    MARK: accsessory tableview
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let cell = tableView.cellForRow(at: indexPath){
            //         var isChecked = false
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
            
            
            //            if indexPath.row == 0 {
            //                row0item.checked = !row0item.checked
            //
            //            }else if indexPath.row == 1 {
            //                row1item.checked = !row1item.checked
            //
            //            }else if indexPath.row == 2 {
            //                row2item.checked = !row2item.checked
            //
            //            }else if indexPath.row == 3 {
            //                row3item.checked = !row3item.checked
            //
            //            }else if indexPath.row == 4 {
            //                row4item.checked = !row4item.checked
            //
            //            }
            
            //            if isChecked {
            //                cell.accessoryType = .checkmark
            //            }else{
            //                cell.accessoryType = .none
            //            }
            
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
  
    
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){
        
        //        let item = items[indexPath.row]
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        //       var isChecked = false
        //        if indexPath.row == 0 {
        //            row0checked = !row0checked
        //            isChecked = row0checked
        //        }else if indexPath.row == 1 {
        //            row1checked = !row1checked
        //            isChecked = row1checked
        //        }else if indexPath.row == 2 {
        //            row2checked = !row2checked
        //            isChecked = row2checked
        //        }else if indexPath.row == 3 {
        //            row3checked = !row3checked
        //            isChecked = row3checked
        //        }else if indexPath.row == 4 {
        //            row4checked = !row4checked
        //            isChecked = row4checked
        //        }
        //
        //        if isChecked {
        //            cell.accessoryType = .checkmark
        //        }else{
        //            cell.accessoryType = .none
        //        }
    }

    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    // MARK:- Actions
//    @IBAction func addItem(){
//        let newRowIndex = items.count
//
//        let item = ChecklistItem()
//        item.text = "I am new row"
//        item.checked = true
//        items.append(item)
//
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //1
        items.remove(at: indexPath.row)
        //2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        //1
        if segue.identifier == "AddItem"{
            //2
            let controller = segue.destination
                as! AddItemViewController
            //3
            controller.delegate = self
            
        }
    }
}
