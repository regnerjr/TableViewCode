import UIKit

class TableViewCell: UITableViewCell {

    func toggleCheckmark(){
        if self.accessoryType == UITableViewCellAccessoryType.None {
            self.accessoryType  = UITableViewCellAccessoryType.Checkmark
        } else {
            self.accessoryType = UITableViewCellAccessoryType.None
        }
    }

}
