import UIKit

class ViewController: UITableViewController {

    let modelData = [1,2,3,4,5,6]


//    override func loadView() {
//        println("Calling Load View")
//        view = UIView(frame: UIScreen.mainScreen().bounds)
//        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
//        view.addSubview(tableView)
//    }

//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        println("Updating Constraints")
//    }

    override func viewDidLoad() {
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        //make the tableView not be under the status bar!
    }

    override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews")
        let vc = view.constraints()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        println(vc)
        let tvc = tableView.constraints()
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        println(tvc)

        let topBarConstraint = getFullScreenExceptStatusBarConstraints(tableView, self.topLayoutGuide)
        tableView.addConstraints(topBarConstraint)
        view.setNeedsLayout()
    }

}


extension ViewController: UITableViewDataSource {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = String(modelData[indexPath.row])
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

func getFullScreenExceptStatusBarConstraints(view: UIView, toplayoutGuide: UILayoutSupport) -> [NSLayoutConstraint]{

    let viewsDict: [NSObject: AnyObject] = ["view" : view, "topGuide" : toplayoutGuide]
//    let horizontalconstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide][view]", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: viewsDict)
    let bindToTop = NSLayoutConstraint(item: toplayoutGuide, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)

    println(view.constraints())
    println(bindToTop)
    return [bindToTop]

}