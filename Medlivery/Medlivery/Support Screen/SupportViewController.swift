//
//  SupportViewController.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import UIKit
import FirebaseFirestore


class SupportViewController: UIViewController {
    
    let messageScreen = SupportView()
    var senderID: String?
    var receiverID: String?
    var chatID: String?

    private var messagesListener: ListenerRegistration?
    private var messages = [Message]()

    override func loadView() {
        view = messageScreen
        setupKeyboardHiding()
    }
    
    func setupKeyboardHiding(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func getBotResponse(message: String) -> String {
        let tempMessage = message.lowercased()
        print("Bot will talk")

        // Regular expression to check for presence of numbers
        let containsNumber = message.rangeOfCharacter(from: .decimalDigits) != nil

        if tempMessage.contains("hello") {
            return "Hey there!"
        } else if tempMessage.contains("hi") {
            return "Hi! How can I assist you today?"
        } else if tempMessage.contains("goodbye") || tempMessage.contains("bye") {
            return "Talk to you later!"
        } else if tempMessage.contains("how are you") {
            return "I'm fine, how about you?"
        } else if tempMessage.contains("thanks") || tempMessage.contains("thank you") {
            return "You're welcome!"
        } else if tempMessage.contains("order") || tempMessage.contains("order status") {
            return "Let me check that for you. Please provide your order number."
        } else if tempMessage.contains("delivery") || tempMessage.contains("delivery time") || tempMessage.contains("delivery status") {
            return "Delivery times vary based on location and current workload. Can you provide your order number for more details?"
        } else if tempMessage.contains("product") || tempMessage.contains("item") || tempMessage.contains("catalog") {
            return "Sure, if there's an issue with the product, please send me the order number so I can process it."
        } else if tempMessage.contains("update") || tempMessage.contains("progress") {
            return "It seems like your order is still being processed. We at Medlivery, appreciate your patience :) Can I assist you with something else in the meantime?"
        } else if tempMessage.contains("return") || tempMessage.contains("exchange") {
            return "Certainly! Please provide your order number and reason for return/exchange."
        } else if tempMessage.contains("cancel") || tempMessage.contains("refund") {
            return "I can assist you with that. Could you please provide your order number?"
        } else if tempMessage.contains("help") || tempMessage.contains("assistance") {
            return "Of course! What do you need assistance with?"
        } else if tempMessage.contains("problem") || tempMessage.contains("issue") {
            return "I'm here to help. Please describe the problem or issue you're facing."
        } else if tempMessage.contains("recommendation") || tempMessage.contains("suggest") {
            return "Sure, I can help with that. Could you please specify your preferences or requirements?"
        } else if tempMessage.contains("pricing") || tempMessage.contains("cost") {
            return "For pricing information, please visit our website or contact our sales team."
        } else if tempMessage.contains("availability") || tempMessage.contains("stock") {
            return "To check product availability, please provide the product name or code."
        } else if tempMessage.contains("contact") || tempMessage.contains("support") {
            return "You can contact our support team at support@medlivery.com or call us at +1-800-123-4567."
        } else if containsNumber {
            return "Thank you providing me with the order number. We will process the same and provide you with an update shortly."
        } else {
            return "I'm sorry, I didn't understand. How can I assist you?"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Customer Support"
        messageScreen.tableViewContacts.dataSource = self
        messageScreen.tableViewContacts.delegate = self
        messageScreen.tableViewContacts.separatorStyle = .none
        messageScreen.tableViewContacts.backgroundColor = Utilities.beigeColor

        messageScreen.buttonSend.addTarget(self, action: #selector(converse), for: .touchUpInside)

        if let senderID = senderID, let receiverID = receiverID {
            self.chatID = "\(senderID)_\(receiverID)"
            observeMessages()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func converse(){
        guard let text = messageScreen.textFieldMessage.text, !text.isEmpty,
              let currentUserID = senderID,
              let receiverUserID = receiverID
        else {
            print("Invalid message or chat information")
            return
        }
        sendMessage(message: text, senderID: currentUserID, receiverID: receiverUserID);
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.botSendMessage(message: self.getBotResponse(message: text), senderID: receiverUserID, receiverID: currentUserID);
        }
    }

    @objc func sendMessage(message: String, senderID: String, receiverID: String) {
        print(message)
        
        guard !message.isEmpty else {
            print("Invalid message")
            return
        }

        let db = Firestore.firestore()

        let messageData: [String: Any] = [
            "senderID": senderID,
            "receiverID": receiverID,
            "text": message,
            "timestamp": FieldValue.serverTimestamp()
        ]

        let chatRefs = [
            db.collection("users").document(senderID).collection("support").document(receiverID),
            db.collection("users").document(receiverID).collection("customers").document(senderID)
        ]

        for chatRef in chatRefs {
            chatRef.collection("messages").addDocument(data: messageData) { error in
                if let error = error {
                    print("Error adding message: \(error)")
                } else {
                    print("Message added successfully to chat: \(chatRef.documentID)")
                    self.messageScreen.textFieldMessage.text = ""
                    self.loadAllMessages()
                }
            }
        }
    }
    
    @objc func botSendMessage(message: String, senderID: String, receiverID: String) {
        guard !message.isEmpty else {
            print("Invalid message")
            return
        }

        let db = Firestore.firestore()

        let messageData: [String: Any] = [
            "senderID": senderID,
            "receiverID": receiverID,
            "text": message,
            "timestamp": FieldValue.serverTimestamp()
        ]

        let chatRefs = [
            db.collection("users").document(senderID).collection("customers").document(receiverID),
            db.collection("users").document(receiverID).collection("support").document(senderID)
        ]

        for chatRef in chatRefs {
            chatRef.collection("messages").addDocument(data: messageData) { error in
                if let error = error {
                    print("Error adding message: \(error)")
                } else {
                    print("Message added successfully to chat: \(chatRef.documentID)")
                    self.messageScreen.textFieldMessage.text = ""
                    self.loadAllMessages()
                }
            }
        }
    }

    private func observeMessages() {
        guard let chatID = chatID else {
            return
        }

        let db = Firestore.firestore()
        let chatRef = db.collection("users").document(senderID!).collection("support").document(receiverID!).collection("messages").order(by: "timestamp", descending: true)

        messagesListener = chatRef.addSnapshotListener { [weak self] querySnapshot, error in
            guard let self = self else { return }

            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error ?? NSError())")
                return
            }

            self.messages = documents.compactMap { queryDocumentSnapshot in
                return try? queryDocumentSnapshot.data(as: Message.self)
            }

            DispatchQueue.main.async {
                self.messageScreen.tableViewContacts.reloadData()
            }
        }
    }
    
    func loadAllMessages() {
        guard let chatID = self.chatID else {
            return
        }

        let db = Firestore.firestore()
        let chatRef = db.collection("users").document(senderID!).collection("support").document(receiverID!).collection("messages").order(by: "timestamp", descending: true)

        chatRef.getDocuments { [weak self] querySnapshot, error in
            guard let self = self else { return }

            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }

            self.messages.removeAll()

            for document in documents {
                if let message = try? document.data(as: Message.self) {
                    self.messages.append(message)
                }
            }
            DispatchQueue.main.async {
                self.messageScreen.tableViewContacts.reloadData()
            }
        }
    }

}

extension SupportViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! SupportTableViewCell
        let message = messages[indexPath.row]
        cell.labelMessage.text = message.text
        cell.labelMessage.clipsToBounds = true
        
        // Update the cell to display sender's name and date/time
        if message.senderID == senderID {
            cell.labelSenderName.text = "You"
        } else {
            cell.labelSenderName.text = self.receiverID // Replace "Sender's Name" with the actual sender's name
        }
        let timestamp = message.timestamp
        let date = timestamp.dateValue() // Convert Timestamp to Date

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        cell.labelDateTime.text = dateFormatter.string(from: date)
        
        // Update cell appearance based on sender
        if message.senderID == senderID {
            cell.updateLayoutForSenderID(true)
            cell.labelMessage.textAlignment = .right
            cell.labelDateTime.textAlignment = .right
            cell.labelSenderName.textAlignment = .right
            cell.labelMessage.backgroundColor = UIColor(red: 0.87, green: 0.96, blue: 0.87, alpha: 1.0)
        } else {
            cell.updateLayoutForSenderID(false)
            cell.labelMessage.textAlignment = .left
            cell.labelDateTime.textAlignment = .left
            cell.labelSenderName.textAlignment = .left
            cell.labelMessage.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        }
        
        return cell
    }
    
}

extension SupportViewController {
    @objc func keyboardWillShow(sender: NSNotification){
        if(self.view.frame.origin.y == 0){
            if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
}
