//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by Hamit  Tırpan on 5.10.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HODOR
        
        let hodorButton = UIButton(type: UIButton.ButtonType.system)
        //Backend'te button oluşturduğun için frame tanımlamam gerekli
        hodorButton.frame = CGRect(x: 150, y: 50, width: 140, height: 120)
        hodorButton.setBackgroundImage(UIImage(named: "hodor.png"), for: UIControl.State.normal)
        hodorButton.addTarget(self, action: #selector(hodorTapped ), for: UIControl.Event.touchUpInside)
        view.addSubview(hodorButton)
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @objc func hodorTapped(){
        // Bir yere yazı yazmak custom keyboardlar için text proxy oluşturmak gerekiyor.
        let textProxy = textDocumentProxy as UITextDocumentProxy
        textProxy.insertText("HODOR!")
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
