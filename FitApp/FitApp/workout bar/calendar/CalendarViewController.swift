
import UIKit

class CalendarViewController: UIViewController {
    
    var ourWorkouts: [String: WorkoutExercise] = [:]
    var workoutDates: Set<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutDates = getWorkoutDates()
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
    
    func getWorkoutDates() -> Set<String> {
        var workoutDates = Set<String>()
        
        // Iterate through UserDefaults keys
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if let _ = UserDefaults.standard.data(forKey: key) {
                workoutDates.insert(key)
            }
        }
        return workoutDates
    }

    
    

}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        dateString = formatter.string(from: Calendar.current.date(from: dateComponents!)!)
    
        print(ourWorkouts)
        
        selection.selectedDate = nil
        performSegue(withIdentifier: "Workout", sender: nil)
        
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        guard let date = Calendar.current.date(from: dateComponents) else { return nil }
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                let dateString = formatter.string(from: date)

                // Check if the date exists in UserDefaults
                if let _ = UserDefaults.standard.data(forKey: dateString) {
                    // If workouts exist for this date, return a custom decoration
                    return .image(UIImage(systemName: "checkmark.circle.fill"), color: .systemGreen, size: .large)
                }

                // Default decoration
        return nil
        
    }
}

