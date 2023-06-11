//
//  Safari.swift
//  Reciplease
//
//  Created by Zidouni on 11/06/2023.
//

import Foundation
import SwiftUI
import SafariServices

struct Safari : UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Safari>) -> SFSafariViewController {
        
        let controller = SFSafariViewController(url: URL(string: url)!)
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<Safari>) {}
}
