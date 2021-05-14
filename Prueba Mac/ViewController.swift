import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var lblNombre: NSTextField!
    @IBOutlet weak var btnAgregar: NSButton!
    @IBOutlet weak var tblTablaNombres: NSTableView!
    
    private var arrNombres: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAgregar.contentTintColor = NSColor(named: "Verde")
        
        tblTablaNombres.delegate = self
        tblTablaNombres.dataSource = self
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func agregarInfo(_ sender: Any) {
        let strNombre: String = txtNombre.stringValue
        if !strNombre.isEmpty {
            lblNombre.stringValue = "Hola \(strNombre)"
            arrNombres.append(strNombre)
            txtNombre.stringValue = ""
            tblTablaNombres.reloadData()
        }
    }
    
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.arrNombres.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let celda = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MiCelda"), owner: nil) as? NSTableCellView else {
            return NSView()
        }
        celda.textField?.stringValue = self.arrNombres[row]
        return celda
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        let storyboard = NSStoryboard(name: "Alerta", bundle: .main)
        guard let controller: AlertaViewController = storyboard.instantiateController(withIdentifier: "Alerta") as? AlertaViewController else {
            return false
        }
        controller.texto = self.arrNombres[row]
        self.presentAsSheet(controller)
        return true
    }
    
}
