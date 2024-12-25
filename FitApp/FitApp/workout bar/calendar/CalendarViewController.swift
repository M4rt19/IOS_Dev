
import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Workout", let destinationVC = segue.destination as? WorkoutViewController {
            if let dateString = self.dateString {
                destinationVC.curentDate = dateString
                print("Passing date to WorkoutViewController: \(dateString)") // Debugging log
            } else {
                print("Date string is nil in prepare(for:sender:).")
            }
        }
    }

    
    
    @IBOutlet weak var headLable : UILabel!
    
    
    
    
    var dateString:String?
    var ourWorkouts:[String: WorkoutExercise]?
    
    func createCalendar() {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 450),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        
        ])
        
        
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        dateString = formatter.string(from: Calendar.current.date(from: dateComponents!)!)
    
        
        performSegue(withIdentifier: "Workout", sender: nil)
        
       
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        return .default()
    }
}

