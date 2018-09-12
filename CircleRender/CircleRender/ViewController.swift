import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CircleRadius: UITextField!
    @IBAction func switchView(_ sender: UIButton) {
        performSegue(withIdentifier: "MySegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC: SecondView = segue.destination as! SecondView
        destVC.dataFromFirst = CircleRadius.text!
        CircleRadius.resignFirstResponder()
    }


}

