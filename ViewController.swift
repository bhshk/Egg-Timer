
import UIKit

class ViewController: UIViewController {
    
  
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBOutlet weak var eggTimerLabel: UILabel!
    @IBOutlet weak var eggProgressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        eggTimerLabel.text = "\(hardness) selected. \nTimer has started!"
        eggProgressBar.progress = 0.0
        secondsPassed = 0
        
        if hardness == "Soft"{
            totalTime = eggTimes["Soft"]!
        } else if hardness == "Medium"{
            totalTime = eggTimes["Medium"]!
        } else if hardness == "Hard"{
            totalTime = eggTimes["Hard"]!
        }
        
        
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
        (Timer) in
        if self.secondsPassed < self.totalTime {
            self.secondsPassed += 1
            let percentageProgress = Float(self.secondsPassed) / Float(self.totalTime)
            self.eggProgressBar.progress = percentageProgress
            
        } else{
            self.eggTimerLabel.text = "Done! \nEnjoy your eggs!"
            }
       }
    }
}
