import UIKit

class ViewController: UITableViewController {

    let stuff = [1,2,3,4,5,6]

    override func viewDidLoad() {
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        //make the tableView not be under the status bar!
        tableView.contentInset = UIEdgeInsets(top: UIApplication.sharedApplication().statusBarFrame.size.height, left: 0, bottom: 0, right: 0)
    }

}


extension ViewController: UITableViewDataSource {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuff.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = String(stuff[indexPath.row])
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as? TableViewCell
        cell?.toggleCheckmark()
        cell?.selected = false
    }
}