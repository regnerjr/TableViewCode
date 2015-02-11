import UIKit

class ViewController: UITableViewController {

    let stuff = [1,2,3,4,5,6]

    override func viewDidLoad() {
        //else your cell reuse will crash
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
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
