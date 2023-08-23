//
//  RegisterView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var animatedBackground: Double = 3.0
    @State var email: String = ""
    
    var body: some View {
        
        VStack(spacing: 25){
            Text("Sign in")
                .font(.title)
                .bold()
            Text("Follow and Know the latest news in the world")
                .font(.headline).opacity(0.7)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading){
                Text("Email")
                    .font(.headline)
                    .foregroundColor(.secondary)
                SecureField("", text: $email)
                    .customTextField(image: "Icon Email")
                
            }
            VStack(alignment: .leading){
                HStack{
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Forget Password")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                TextField("", text: $email)
                    .customTextField(image: "Icon Lock")
                
            }
            Button {
                //action
            } label: {
                Image(systemName: "arrow.right")
                    .bold()
                Text("Sign in")
                    .bold()
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
            .roundedCorner(5, corners: [.topLeft])
            
            HStack{
                Rectangle().frame(height: 1).opacity(0.2)
                Text("OR").opacity(0.3).font(.headline)
                Rectangle().frame(height: 1).opacity(0.2)
            }
            
            Text("Sign up with Email, Apple or Google")
                .font(.headline)
                .opacity(0.7)
            HStack{
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
            
        }//: VStack
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.4), radius: 9, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.4), radius: 30, x: 0, y: 30)
        .padding()
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
