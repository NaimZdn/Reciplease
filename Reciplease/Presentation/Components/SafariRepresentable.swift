//
//  SafariRepresentable.swift
//  Reciplease
//
//  Created by Zidouni on 11/06/2023.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariRepresentable : UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariRepresentable>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: url)!)
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariRepresentable>) { }
}
