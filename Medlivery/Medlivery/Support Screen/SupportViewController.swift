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
    }
    
    func getBotResponse(message: String) -> String {
        let tempMessage = message.lowercased()
        print("Bot will talk")
        if tempMessage.contains("hello") {
            return "Hey there!"
        } else if tempMessage.contains("goodbye") {
            return "Talk to you later!"
        } else if tempMessage.contains("how are you") {
            return "I'm fine, how about you?"
        } else {
            return "That's cool."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Customer Support"
        navigationController?.navigationBar.prefersLargeTitles = true
        messageScreen.tableViewContacts.dataSource = self
        messageScreen.tableViewContacts.delegate = self
        messageScreen.tableViewContacts.separatorStyle = .none

        // Set up send button action
        messageScreen.buttonSend.addTarget(self, action: #selector(converse), for: .touchUpInside)

        // Fetch chat ID based on senderID and receiverID
        if let senderID = senderID, let receiverID = receiverID {
            self.chatID = "\(senderID)_\(receiverID)"
            observeMessages()
        }
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
        botSendMessage(message: getBotResponse(message: text), senderID: receiverUserID, receiverID: currentUserID);
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
//            print(self.messages)
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
        if message.senderID != "support@medlivery.com" {
            cell.labelMessage.textAlignment = .right
            cell.labelMessage.backgroundColor = UIColor(red: 0.87, green: 0.96, blue: 0.87, alpha: 1.0)
        } else {
            cell.labelMessage.textAlignment = .left
            cell.labelMessage.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        }
        
        return cell
    }
    
}
