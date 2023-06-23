//
//  ImageView.swift
//  Reciplease
//
//  Created by Zidouni on 22/06/2023.
//

import SwiftUI

struct ImageView: View {
    let imageURL: URL
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}


struct ImageView_Previews: PreviewProvider {
    @State static private var imageURL = URL(string: "https://edamam-product-images.s3.amazonaws.com/web-img/873/873d09161f6847aadd22f8c17f3b9e01.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHsaCXVzLWVhc3QtMSJHMEUCIQDamt%2B50ojX9ESwJLKPaL1IYFKkqFwfNWXZbrYP3xrZ8QIgeRZaXdjPsE6tWurk70z2dkQ5y8aVHRfCQIpq5Um6b7MqwQUI1P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDNtEOBGBYrmnYpryEyqVBY108K0uBjAKkf5dnddluFcptOUXe5Oz5OZs1mrsy3asRCraDRnN2eysgJCV5Zu1iOpWhjagraIL3IkNkrLfdD2OPLWynPXPjaPkOQcny75%2FyEkukVE5ezHQgcilde7yzCEhLEsuiRfC9qtL7vKz54jvp00XG%2BHwi8GFiOxWF60%2FcjHpxwr%2ByOUkCIjFe64QJmuFM%2FhKe5feduuzXeQ2ptjF%2FwMRMiPAiD4sq4jFRKKi63oAc4ThOVDQ1JzbrMrA3zfdayV9MtpwXubB2PZZeJy2O2LLPpEEz4qUqQSGOgxwx0uJ46MFDsLjLRASlBaA508HfPGRH5kUlvhVCPg3DClR3fqW63COTFR0ZgmDDxnncOlNc99lBT6fPRqU8OGhLq4sJH225KRhD27kbBitwbyx7JeJ3Trp%2FOU1ExS3frxsFFq8LKsgSI3RDzZD8eD6RCKwVHGMMGRLVYq%2BVWf9CMcRYXnfG6bgmKBFCCA4E0HjSexptdhm6zdPGTb0olWKqqJqkaOqmCqxyGsJ1ye5bzOhVFIPJuhKZ4tmZbEkStA2h1E1q3caAq1T0PiauGQkUoou5Umt%2Bz07MJ%2Bs%2FGZEcaVG6PccEJ8LAggTmbiWVuR74lXUv9epd1b6PhFs%2FP4aG47sBgASnUBBgE7op1EK8lv8CoGBvoTxiuixeENSuh5KqtHdrBsR5lrycnMD3qkvjJ7dd4A49NYmqNEOY2hJZScVSVxyCLGmmoLJMRQu1tUpye8vwqqrNbyW0k23vOuSNoObia%2FxsNqe9gjH5HPf8Qb4HdBIGiEIcrHaG%2BnT%2B%2FG9LFfFEK5dXvI8uy9T%2BHb7WyBorJbQ3kI0YDKNCs11Xec2MeN7oyH%2BLCoJwqeimIqCWV2CZXsw8cjQpAY6sQFDnEESrFe%2Bs8ojTk3xRd3h3Is%2FgBSIneanbgWyynHQvbLXyigF2uqDbrenjBh%2FENvgZlzJP5D5zQfiQXM07ZrKunqB3RXWJcI3cxj3XA9doWytFYj2lfmET0IGPChrt06%2BXv8nw3jjlidhY3MOM0E04SCyz3vcsJM37DkhAJJpJQzXDnXjakNu3Dj4HjODUkjf6V%2B9K2XZWrR3aPhLaK60g47lxVnrsXvbjGcM19AebCc%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230622T110702Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFPCDFMDYB%2F20230622%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9097fc6b98f61131cdf83b1e00a8e4863d59c862780a9d90118043a889bfcc46")!
    
    static var previews: some View {
        ImageView(imageURL: imageURL)
    }
}
