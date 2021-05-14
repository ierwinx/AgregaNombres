import Cocoa

class AlertaViewController: NSViewController {

    @IBOutlet private weak var lblTextoSel: NSTextField!
    
    public var texto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alerta"
        guard let textoResp = texto else {
            return
        }
        lblTextoSel.stringValue = "Se presiono \(textoResp)"
    }
    
    @IBAction private func aceptarAction(_ sender: Any) {
        self.dismiss(self)
    }
    
}
