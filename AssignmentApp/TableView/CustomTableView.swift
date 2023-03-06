//
//  CustomTableView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 06/03/23.
//

import UIKit

class CustomTableView : UIView,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var stackView : UIStackView?
    private var tableView : UITableView?
    private var appBarView : AppBarView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stackView = UIStackView()
        self.tableView = UITableView()
        self.appBarView = AppBarView()
        setupTableView()
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var storeItems: [Item] = [] {
        didSet {
         baseItems = storeItems
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    var baseItems : [Item] = []
    

    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        appBarView?.searchBar.delegate = self
        stackView?.addArrangedSubview(appBarView!)
        stackView?.addArrangedSubview(tableView!)
        addSubview(stackView!)
        TableUtils(tableView: tableView!, view: self, stackView: stackView!, appBar: appBarView!).setTableValues()
        TableUtils(tableView: tableView!, view: self, stackView: stackView!, appBar: appBarView!).setupStackView()
        _ = TableViewConstraints(appBar: appBarView!, tableView: tableView!, view: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return   baseItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell
        let item = baseItems[indexPath.row]
        return TableUtils(tableView: tableView, view: self, stackView: stackView!, appBar: appBarView!).setupCell(item: item, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableRowHeight
    }
    
    func search(forText: String){
        
        baseItems = baseItems.filter { item in
            item.name.lowercased().contains(forText.lowercased())
        }
        tableView?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.isEmpty){
            baseItems = storeItems
            tableView?.reloadData()
        }else{
            search(forText: searchText)}
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        baseItems = storeItems
    }
    
}
