//
//  Seetings.swift
//  Reciplease
//
//  Created by Zidouni on 21/05/2023.
//

import Foundation
import SwiftUI

enum Label: String, CaseIterable {
    case notification = "Enable notification"
    case colorMode = "Dark mode"
    case about = "About us"
    case privacy = "Privacy policy"
    case term = "Term of service"
    
    var icon: String {
        switch self {
        case .notification:
            return "bell"
        case .colorMode:
            return "sun"
        case .about:
            return "question"
        case .privacy:
            return "book"
        case .term:
            return "rules"
        }
    }
}

enum Techno: String, CaseIterable {
    case swift = "Swift"
    case swiftUi = "Swift UI"
    case combine = "Combine"
    case alamofire = "Alamofire"
    case coreData = "Core Data"
    case figma = "Figma"
}

enum Term: String, CaseIterable {
    case content = "Content"
    case intellectualProperty = "Intellectual property"
    case termination = "Termination"
    case indemnification = "Indemnification"
    case governingLoaw = "Governing Law"
    case changes = "Changes"
    case contactUs = "Contact Us"
    
    var content: String {
        switch self {
        case .content:
           return "Our App allows you to find and save recipes. The content provided through the App is for informational purposes only.\n\nWe do not guarantee the accuracy, completeness, or usefulness of any content available through the App. Your use of any content is at your own risk."
        case .intellectualProperty:
            return "The App and its original content (excluding user-generated content) are the sole property of NaimZdn and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws."
        case .termination:
            return "We may terminate or suspend your access to the App immediately, without prior notice or liability, for any reason whatsoever, including, without limitation, if you breach the Terms."
        case .indemnification:
            return "You agree to indemnify and hold harmless NaimZdn and its affiliates, officers, directors, employees, and agents from and against any and all claims, liabilities, damages, losses, or expenses, including reasonable attorneys' fees and costs, arising out of or in any way connected with your use of the App or violation of these Terms."
        case .governingLoaw:
            return "These Terms shall be governed and construed in accordance with the laws of France, without regard to its conflict of law provisions."
        case .changes:
            return "We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days notice prior to any new terms taking effect.\n\nWhat constitutes a material change will be determined at our sole discretion."
        case .contactUs:
            return "If you have any questions about these Terms, please contact us at support@reciplease.io."
        }
    }
}

enum PrivacyPolicy: String, CaseIterable {
    case informationCollection = "Information Collection and Use"
    case data = "Data Security"
    case informationSharing = "Information Sharing"
    case changes = "Changes to this Privacy Policy"
    case consent = "Your Consent"
    
    var content: String {
        switch self {
        case .informationCollection:
            return "We may collect personal information, such as your name and email address, when you interact with our app.\n\nThis information is used to personalize your experience and improve our services."
        case .data:
            return "We employ industry-standard security measures to protect your personal information from unauthorized access or disclosure.\n\nWe use encryption, firewalls, and secure server infrastructure to safeguard your data."
        case .informationSharing:
            return "We do not sell, trade, or share your personal information with third parties without your consent, except as required by law."
        case .changes:
            return "We reserve the right to update or modify this Privacy Policy at any time. Any changes will be effective when posted on this page."
        case .consent:
            return "By using our app, you consent to our Privacy Policy and agree to its terms and conditions."
        }
    }
}

enum Link: String,CaseIterable {
    case linkedin
    case github
    
    var isPresented: Bool {
        switch self {
        case .linkedin:
            return false
        case .github:
            return false
        }
    }
    
    var link: String {
        switch self {
        case .linkedin:
            return "https://www.linkedin.com/in/naim-zidouni/"
        case .github:
            return "https://github.com/NaimZdn"
        }
    }
}
