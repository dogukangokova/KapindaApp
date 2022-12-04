//
//  ContentView.swift
//  Kapinda
//
//  Created by dogukangokova on 21.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    
    @State var maxCircleHeight : CGFloat = 0
    
    var body: some View {
        VStack{
            //TOP
            GeometryReader{proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0 {
                        maxCircleHeight = height
                    }
                }
                
                return AnyView(
                    
                    ZStack{
                        Circle()
                            .fill(Color(UIColor(red: 252.0/255.0, green: 104.0/255.0, blue: 72.0/255.0, alpha: 1.0)))
                            .offset(x: -getRect().width / 2, y: -height / 1.5)
                            
                        
                        Circle()
                            .fill(Color(.black))
                            .offset(x: getRect().width / 2, y: -height / 1.3)
                        
                        Circle()
                            .fill(Color(UIColor(red: 236.0/255.0, green: 169.0/255.0, blue: 26.0/255.0, alpha: 1.0)))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                    }
                )
            }
            .frame(maxHeight: getRect().width)
            
            VStack {
                Text("Giriş Yap")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.black))
                    .kerning(1.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("E-Posta Adresi")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("E-Posta Adresiniz", text: $email)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(.black))
                        .padding(.top, 5)
                    
                    Divider()
                })
                
                .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Şifre")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    SecureField("Şifreniz", text: $password)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(.black))
                        .padding(.top, 5)
                    
                    Divider()
                })
                .padding(.top, 20)
                
                Button(action: {}, label: {
                    Text("Şifremi Unuttum")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.darkText))
                        .clipShape(Circle())
                        .shadow(color: Color(UIColor(red: 252.0/255.0, green: 104.0/255.0, blue: 72.0/255.0, alpha: 1.0)), radius: 5, x: 0, y: 0)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
                    
            }
            .padding()
            .padding(.top, -maxCircleHeight / 1.7)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            HStack{
                Text("Hesabınız mı yok?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Button(action: {}, label: {
                    Text("Hesap Yaratın")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                })
            }
                .offset(y: getSafeArea().bottom - 85)
            , alignment: .bottom
        )
        
        .background(
            HStack {
                Circle()
                    .fill(Color(UIColor(red: 252.0/255.0, green: 104.0/255.0, blue: 72.0/255.0, alpha: 1.0)))
                    .frame(width: 70, height: 80)
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(Color(UIColor(red: 236.0/255.0, green: 169.0/255.0, blue: 26.0/255.0, alpha: 1.0)))
                    .offset(y: getSafeArea().bottom - 25)
                    .frame(width: 110, height: 110)
                
            }
                .offset(y: getSafeArea().bottom + 30)
            , alignment: .bottom
            
        )
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}*/

