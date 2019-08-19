import Foundation
import UIKit
import AppCenterAnalytics

class EditEntryViewController: UIViewController
{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var entry: Entry? = nil
    
    override func viewDidLoad()
    {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(EditEntryViewController.onSave))

        navigationItem.rightBarButtonItem = saveButton

        if entry == nil
        {
            entry = Entry()
            self.title = "Add New Entry"
             MSAnalytics.trackEvent("User created entry")
        } else
        {
            let time = -((entry?.createdDate.timeIntervalSinceNow)!)
            let interval = String(format: "%.0f",time)
            
            let properties = ["id": entry!.id, "time": interval]
            
             MSAnalytics.trackEvent("User edited entry", withProperties: properties)
        }
        
        titleTextField.text = entry?.title
        contentTextView.text = entry?.content
    }

    @objc func onSave(_ sender: UIBarButtonItem)
    {
       
        
        entry?.title = titleTextField.text!
        entry?.content = contentTextView.text!
        
        AppDelegate.entries.write(entry!)
                
        navigationController?.popViewController(animated: true)
    }
}
