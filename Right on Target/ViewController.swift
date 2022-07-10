import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
        let vesionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        vesionLabel.text = "Версия 1.1"
        view.addSubview(vesionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        number = Int.random(in: 1...50)
        label.text = String(number)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDissapear")
    }
    
    @IBAction func checkNumber() {
        let numSlider = Int(slider.value)
        if numSlider > number {
            points += 50 - numSlider + number
        } else if numSlider < number {
            points += 50 - number + numSlider
        } else {
            points += 50
        }
        if round == 5 {
            let alert = UIAlertController(title: "Игра окончена",
                                          message: "Вы заработали \(points) очков",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново",
                                          style: .default,
                                          handler: nil))
            present(alert, animated: true, completion: nil)
            round = 1
            points = 0
        } else {
            round += 1
        }
        number = Int.random(in: 1...50)
        label.text = String(number)
    }
}


