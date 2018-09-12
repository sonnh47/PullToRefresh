
import UIKit

class MasterTableViewController: UITableViewController {
    
    var refresh: UIRefreshControl!
    var arrNames = ["Nguyen Hoang SOn", "Nguyen A Hoan"]

    override func viewDidLoad() {
        super.viewDidLoad()
        refresh = UIRefreshControl()
        tableView.addSubview(refresh)
        refresh.attributedTitle = NSAttributedString(string: "pull refresh")
        refresh.addTarget(self, action: #selector(addNames), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func addNames() {
        //refresh.beginRefreshing()
        let arrNewNames = ["Le Van Luyen", "Cuop Vang"]
        for i in arrNewNames {
            arrNames.insert(i, at: 0)
        }
        //arrNames.insert("String", at: 0)
        tableView.reloadData()
        refresh.endRefreshing()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.row]
        
        return cell
    }
    

}
