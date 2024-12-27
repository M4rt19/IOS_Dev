
import UIKit

class CalendarViewController: UIViewController {
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workoutDates = getWorkoutDates()
        refreshCalendar()
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
        calendarView.layer.cornerRadius = 10
        calendarView.backgroundColor = .systemYellow
        
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
    
    func refreshCalendar() {
        // Remove the existing calendar view
        for subview in view.subviews where subview is UICalendarView {
            subview.removeFromSuperview()
        }
        
        // Recreate the calendar
        createCalendar()
    }

    
    
    func updateWorkoutDates(for dateString: String) {
        // Attempt to fetch data for the given date
        if let data = UserDefaults.standard.data(forKey: dateString) {
            do {
                let decoder = JSONDecoder()
                let workout = try decoder.decode([String: WorkoutExercise].self, from: data)
                
                if workout[dateString]!.exercises.isEmpty {
                    // No exercises: remove date from workoutDates and UserDefaults
                    workoutDates.remove(dateString)
                    UserDefaults.standard.removeObject(forKey: dateString)
                } else {
                    // Ensure the date is in the set if there are exercises
                    workoutDates.insert(dateString)
                }
            } catch {
                // If decoding fails, remove the invalid data
                print("Error decoding workout data: \(error.localizedDescription)")
                UserDefaults.standard.removeObject(forKey: dateString)
            }
        } else {
            // If no data exists, remove the date
            workoutDates.remove(dateString)
            UserDefaults.standard.removeObject(forKey: dateString)
        }
        
        // Refresh the calendar to reflect the changes
        refreshCalendar()
    }




    
    

}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        dateString = formatter.string(from: Calendar.current.date(from: dateComponents!)!)
        
        selection.selectedDate = nil
        
        performSegue(withIdentifier: "Workout", sender: nil)
        
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        guard let date = Calendar.current.date(from: dateComponents) else { return nil }
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            let dateString = formatter.string(from: date)
            
            // Check if the date exists in workoutDates
            if workoutDates.contains(dateString) {
                return .image(UIImage(systemName: "checkmark.circle.fill"), color: .systemGreen, size: .large)
            }
            
            return nil
        
    }
}

