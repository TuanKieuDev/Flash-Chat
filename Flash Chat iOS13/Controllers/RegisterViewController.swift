import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text { //solve optional -> nonoptional
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error { //solve optional -> nonoptional
                    print(e.localizedDescription)
                } else {
                    //navigate to the ChatViewController
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                    //because we are inside a closure -> add "self" in front of any methods in current class
                }
            }
            
        }
    }
    
}
