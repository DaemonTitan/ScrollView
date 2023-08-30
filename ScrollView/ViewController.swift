//
//  ViewController.swift
//  ScrollView
//
//  Created by Tony Chen on 6/6/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    lazy var taskTitleTextField: UITextField = {
        var taskTitleTextField = UITextField()
        taskTitleTextField.attributedPlaceholder = NSAttributedString(string: "Enter task title...",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) ])
        taskTitleTextField.font = .systemFont(ofSize: 20)
        taskTitleTextField.tintColor = .white
        taskTitleTextField.textColor = .white
        taskTitleTextField.backgroundColor = #colorLiteral(red: 0.1891352587, green: 0.4444419427, blue: 1, alpha: 1)
        taskTitleTextField.layer.cornerRadius = 8.0
        taskTitleTextField.addBottomBorder(height: 1.0, color: .white)
        taskTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        return taskTitleTextField
    }()
    
    /// Record task note
    lazy var noteTextField: UITextField = {
        var noteTextField = UITextField()
        noteTextField.attributedPlaceholder = NSAttributedString(string: "Add note...",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) ])
        noteTextField.tintColor = .white
        noteTextField.textColor = .white
        noteTextField.backgroundColor = #colorLiteral(red: 0.1891352587, green: 0.4444419427, blue: 1, alpha: 1)
        noteTextField.layer.cornerRadius = 8.0
        noteTextField.addBottomBorder(height: 1.0, color: .white)
        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        return noteTextField
    }()

    /// Task titile and notes stack view
    lazy var taskDetailStackView: UIStackView = {
        var taskDetailStackView = UIStackView()
        taskDetailStackView.axis = .vertical
        taskDetailStackView.spacing = 13
        taskDetailStackView.alignment = .fill
        taskDetailStackView.distribution = .fill
        taskDetailStackView.addArrangedSubview(taskTitleTextField)
        taskDetailStackView.addArrangedSubview(noteTextField)
        taskDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        return taskDetailStackView
    }()
    
    /// Flag label
    lazy var flagLabel: UILabel = {
        var flagLabel = UILabel()
        let sfSymbolName = "flag.circle.fill"
        let flagText = " Flag"
        let sfImageConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25.0))
        let image = UIImage(systemName: sfSymbolName, withConfiguration: sfImageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        flagLabel.addImageToFrontLabel(image: image ?? UIImage(), text: flagText)
        flagLabel.textAlignment = .left
        flagLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        flagLabel.font = .systemFont(ofSize: 18)
        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        return flagLabel
    }()
    
    /// Flag switch
    lazy var flagSwitch: UISwitch = {
        var flagSwitch = UISwitch()
        flagSwitch.onTintColor = #colorLiteral(red: 1, green: 0.5433388929, blue: 0, alpha: 1)
        flagSwitch.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        flagSwitch.layer.cornerRadius = 16
        flagSwitch.isOn = false
        flagSwitch.translatesAutoresizingMaskIntoConstraints = false
        return flagSwitch
    }()
    
    /// Flag stack view
    lazy var flagStackView: UIStackView = {
        var flagStackView = UIStackView()
        flagStackView.axis = .horizontal
        flagStackView.spacing = 10
        flagStackView.alignment = .fill
        flagStackView.distribution = .fill
        flagStackView.addArrangedSubview(flagLabel)
        flagStackView.addArrangedSubview(flagSwitch)
        flagStackView.translatesAutoresizingMaskIntoConstraints = false
        return flagStackView
    }()
    
    /// Reminder me Label
    lazy var reminderMeLabel: UILabel = {
        var reminderMeLabel = UILabel()
        let sfSymbolName = "calendar.circle.fill"
        let flagText = " Reminder me"
        let sfImageConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25.0))
        let image = UIImage(systemName: sfSymbolName, withConfiguration: sfImageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        reminderMeLabel.addImageToFrontLabel(image: image ?? UIImage(), text: flagText)
        reminderMeLabel.textAlignment = .left
        reminderMeLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        reminderMeLabel.font = .systemFont(ofSize: 18)
        reminderMeLabel.translatesAutoresizingMaskIntoConstraints = false
        return reminderMeLabel
    }()
    
    /// Switches to enable due date
    lazy var reminderMeSwitch: UISwitch = {
        var reminderMeSwitch = UISwitch()
        reminderMeSwitch.onTintColor = #colorLiteral(red: 0.2360480191, green: 1, blue: 0.2006964495, alpha: 1)
        reminderMeSwitch.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        reminderMeSwitch.layer.cornerRadius = 16
        reminderMeSwitch.isOn = false
        reminderMeSwitch.translatesAutoresizingMaskIntoConstraints = false
        return reminderMeSwitch
    }()
    
    /// Reminder me calender date picker
    lazy var remindMeDatePicker: UIDatePicker = {
        var remindMeDatePicker = UIDatePicker()
        remindMeDatePicker.datePickerMode = .date
        remindMeDatePicker.isHidden = true
        remindMeDatePicker.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        remindMeDatePicker.overrideUserInterfaceStyle = .dark
        remindMeDatePicker.preferredDatePickerStyle = .inline
        remindMeDatePicker.translatesAutoresizingMaskIntoConstraints = false
        return remindMeDatePicker
    }()
    
    // Reminder me Stack view
    lazy var dateStackView: UIStackView = {
        var dateStackView = UIStackView()
        dateStackView.axis = .horizontal
        dateStackView.spacing = 10
        dateStackView.alignment = .fill
        dateStackView.distribution = .fill
        dateStackView.addArrangedSubview(reminderMeLabel)
        dateStackView.addArrangedSubview(reminderMeSwitch)
        dateStackView.translatesAutoresizingMaskIntoConstraints = false
        return dateStackView
    }()
    
    /// Save task button
    lazy var saveTaskButton: UIButton = {
        var saveTaskButton = UIButton()
        saveTaskButton.configuration = .filled()
        saveTaskButton.tintColor = .white
        saveTaskButton.configuration?.title = "Save"
        saveTaskButton.titleLabel?.font = .systemFont(ofSize: 100, weight: .bold)
        saveTaskButton.layer.cornerRadius = 20.0
        saveTaskButton.layer.masksToBounds = true
        saveTaskButton.translatesAutoresizingMaskIntoConstraints = false
        return saveTaskButton
    }()
    
    /// Add another task button
    lazy var addMoreButton: UIButton = {
        var addMoreButton = UIButton()
        addMoreButton.configuration = .filled()
        addMoreButton.tintColor = .white
        addMoreButton.configuration?.title = "Add more"
        addMoreButton.titleLabel?.font = .systemFont(ofSize: 100, weight: .bold)
        addMoreButton.layer.cornerRadius = 20.0
        addMoreButton.layer.masksToBounds = true
        addMoreButton.translatesAutoresizingMaskIntoConstraints = false
        return addMoreButton
    }()
    
    /// Delete task button
    lazy var deleteTaskButton: UIButton = {
        var deleteTaskButton = UIButton()
        deleteTaskButton.configuration = .filled()
        deleteTaskButton.tintColor = .white
        deleteTaskButton.configuration?.title = "Delete"
        deleteTaskButton.titleLabel?.font = .systemFont(ofSize: 100, weight: .bold)
        deleteTaskButton.layer.cornerRadius = 20.0
        deleteTaskButton.layer.masksToBounds = true
        deleteTaskButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteTaskButton
    }()
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        scrollView.frame = view.bounds
        scrollView.bounces = true
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.backgroundColor = .purple
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 0.1891352587, green: 0.4444419427, blue: 1, alpha: 1)
        view.backgroundColor = .blue
//        view.addSubview(taskDetailStackView)
//        view.addSubview(flagStackView)
//        view.addSubview(dateStackView)
//        view.addSubview(remindMeDatePicker)
//        view.addSubview(deleteTaskButton)
//        view.addSubview(saveTaskButton)
        //view.endEditing(true)
        configureView()
        //sView()
        
        taskTitleTextField.delegate = self
        noteTextField.delegate = self
        
        scrollView.alwaysBounceVertical = true
    
        taskTitleTextField.becomeFirstResponder()
        taskTitleTextField.returnKeyType = .next
        noteTextField.returnKeyType = .done
        
        toggleReminderMeSwitch()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        //dismissKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 80
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    func configureView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        //configureLayout()

        layout()
    }
    
    
    func layout() {
        contentView.addSubview(taskTitleTextField)
        contentView.addSubview(noteTextField)
        contentView.addSubview(flagSwitch)
        contentView.addSubview(reminderMeSwitch)
        contentView.addSubview(remindMeDatePicker)
        contentView.addSubview(saveTaskButton)

        NSLayoutConstraint.activate([
            taskTitleTextField.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            taskTitleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            taskTitleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            taskTitleTextField.heightAnchor.constraint(equalToConstant: 40),

            noteTextField.topAnchor.constraint(equalTo: taskTitleTextField.bottomAnchor, constant: 50),
            noteTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            noteTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            noteTextField.heightAnchor.constraint(equalToConstant: 40),

            flagSwitch.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 50),
            flagSwitch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            flagSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            flagSwitch.heightAnchor.constraint(equalToConstant: 40),

            reminderMeSwitch.topAnchor.constraint(equalTo: flagSwitch.bottomAnchor, constant: 50),
            reminderMeSwitch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            reminderMeSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            reminderMeSwitch.heightAnchor.constraint(equalToConstant: 40),

            remindMeDatePicker.topAnchor.constraint(equalTo: reminderMeSwitch.bottomAnchor, constant: 50),
            remindMeDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            remindMeDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),

            saveTaskButton.topAnchor.constraint(equalTo: remindMeDatePicker.bottomAnchor, constant: 100),
            saveTaskButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            saveTaskButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            saveTaskButton.heightAnchor.constraint(equalToConstant: 40),

            saveTaskButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    
    
//    func configureLayout() {
//        contentView.addSubview(taskDetailStackView)
//        contentView.addSubview(flagStackView)
//        contentView.addSubview(dateStackView)
//        contentView.addSubview(remindMeDatePicker)
//        contentView.addSubview(saveTaskButton)
//        NSLayoutConstraint.activate([
//            taskDetailStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            taskDetailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            taskDetailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            taskTitleTextField.heightAnchor.constraint(equalToConstant: 40),
//            noteTextField.heightAnchor.constraint(equalToConstant: 30),
//
//            flagStackView.topAnchor.constraint(equalTo: taskDetailStackView.bottomAnchor, constant: 50),
//            flagStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
//            flagStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
//
//            reminderMeSwitch.heightAnchor.constraint(equalToConstant: 31),
//
//            dateStackView.topAnchor.constraint(equalTo: flagStackView.bottomAnchor, constant: 50),
//            dateStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
//            dateStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
//
//            remindMeDatePicker.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 50),
//            remindMeDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
//            remindMeDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
//
//            saveTaskButton.topAnchor.constraint(equalTo: remindMeDatePicker.bottomAnchor, constant: 20),
//            saveTaskButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
//            saveTaskButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
//            saveTaskButton.heightAnchor.constraint(equalToConstant: 40),
//        ])
//    }
    
//    func sView() {
//        NSLayoutConstraint.activate([
//            taskDetailStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//            taskDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
//            taskDetailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//
//            taskTitleTextField.heightAnchor.constraint(equalToConstant: 40),
//            noteTextField.heightAnchor.constraint(equalToConstant: 30),
//            reminderMeSwitch.heightAnchor.constraint(equalToConstant: 31),
//
//            flagStackView.topAnchor.constraint(equalTo: taskDetailStackView.bottomAnchor, constant: 20),
//            flagStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
//            flagStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//
//            dateStackView.topAnchor.constraint(equalTo: flagStackView.bottomAnchor, constant: 20),
//            dateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
//            dateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//
//            remindMeDatePicker.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
//            remindMeDatePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
//            remindMeDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
//
//            deleteTaskButton.topAnchor.constraint(equalTo: remindMeDatePicker.bottomAnchor, constant: 110),
//            deleteTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80),
//            deleteTaskButton.heightAnchor.constraint(equalToConstant: 40),
//            deleteTaskButton.widthAnchor.constraint(equalToConstant: 150),
//
//            saveTaskButton.topAnchor.constraint(equalTo: remindMeDatePicker.bottomAnchor, constant: 110),
//            saveTaskButton.leadingAnchor.constraint(equalTo: deleteTaskButton.trailingAnchor, constant: 20),
//            saveTaskButton.heightAnchor.constraint(equalToConstant: 40),
//            saveTaskButton.widthAnchor.constraint(equalToConstant: 150),
//        ])
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == taskTitleTextField {
            noteTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }

    
    func toggleReminderMeSwitch() {
        reminderMeSwitch.addTarget(self, action: #selector(hideReminderMeField), for: .valueChanged)
    }

    @objc func hideReminderMeField() {
        remindMeDatePicker.isHidden = !reminderMeSwitch.isOn
        
    }
    
    func dismissKeyboard() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self,
                                                                     action: #selector(dismissKeyboardTouchOutside))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
        }
        
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }

}



extension UITextField {
    internal func addBottomBorder(height: CGFloat = 0.5 , color: UIColor = .black) {
          let borderView = UIView()
          borderView.backgroundColor = color
          borderView.translatesAutoresizingMaskIntoConstraints = false
          addSubview(borderView)
          NSLayoutConstraint.activate(
              [
                  borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                  borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                  borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                  borderView.heightAnchor.constraint(equalToConstant: height)
              ]
          )
      }
}

extension UILabel {
    func addImageToFrontLabel(image: UIImage, text: String) {
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        // Set bound to reposition
        let imageOffsetY: CGFloat = -7.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: text)
        completeText.append(textAfterIcon)
        self.textAlignment = .center
        self.attributedText = completeText
    }
}

extension UIButton {
    //MARK:- Animate check mark
    func checkboxAnimation(closure: @escaping () -> Void){
        guard let image = self.imageView else {return}
        self.adjustsImageWhenHighlighted = false
        self.isHighlighted = false

        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                //to-do
                closure()
                image.transform = .identity
            }, completion: nil)
        }
    }
    
    func sfButtonState(sfImage: String, sfSize: Double, color: UIColor, state: State) {
        let sfImage = sfImage
        let sfImageConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: CGFloat(sfSize)))
        let image = UIImage(systemName: sfImage, withConfiguration: sfImageConfig)?.withTintColor(color, renderingMode: .alwaysOriginal)
        self.setImage(image, for: state)
    }
    
    
//    func checkboxAnimation(label: UILabel, closure: @escaping () -> Void) {
//        guard let image = self.imageView else { return }
//        self.adjustsImageWhenHighlighted = false
//        self.isHighlighted = false
//
//        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
//            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//
//        }) { (success) in
//            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
//                self.isSelected = !self.isSelected
//
//                // Toggle the strike-through effect on the label's text
//                let attributedText = NSMutableAttributedString(string: label.text ?? "")
//                let attributes: [NSAttributedString.Key: Any]
//
//                if self.isSelected {
//                    attributes = [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
//                } else {
//                    attributes = [:]
//                }
//
//                attributedText.addAttributes(attributes, range: NSMakeRange(0, attributedText.length))
//                label.attributedText = attributedText
//
//                closure()
//                image.transform = .identity
//            }, completion: nil)
//        }
//    }
}

