//
//  ProfileController.swift
//  imagePicker
//
//  Created by God on 10/2/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var imageProfile: UIImageView!
    @IBAction func addNewPhoto(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePickerVC, animated: true)
    }
    
    @IBAction func tapPiece(_ gestureRecognizer : UITapGestureRecognizer ) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .ended {      // Move the view down and to the right when tapped.
            let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                gestureRecognizer.view!.center.x += 100
                gestureRecognizer.view!.center.y += 100
            })
            animator.startAnimation()
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            present(imagePickerVC, animated: true)
            
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        
       imageProfile.makeCircular()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageProfile.image = image
        imageProfile.makeCircular()
        dismiss(animated: true, completion: nil)
    }
}
