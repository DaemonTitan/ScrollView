//
//  NewClass.swift
//  ScrollView
//
//  Created by Tony Chen on 9/6/2023.
//

import UIKit

class newClass {
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        //scrollView.frame = view.bounds
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
    
    func showKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func hideKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification, view: UIView) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 80
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
