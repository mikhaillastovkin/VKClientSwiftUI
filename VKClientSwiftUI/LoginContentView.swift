//
//  ContentView.swift
//  VKClientSwiftUI
//
//  Created by Михаил Ластовкин on 29.03.2022.
//

import SwiftUI
import Combine

struct LoginContentView: View {

    @State private var login = ""
    @State private var password = ""

    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
    .map { _ in true }, NotificationCenter.default.publisher(for:
    UIResponder.keyboardWillHideNotification) .map { _ in false }
    )
    .removeDuplicates()

    var body: some View {
        ScrollView {
            VStack {
                Text("VK Client")
                    .font(Font.system(size: 50, weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(Color.blue)
                VStack {
                    HStack {
                        Text("Имя пользователя:")
                            .padding(.leading, 20)
                        Spacer()
                        TextField("", text: $login)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200, alignment: .center)
                            .padding(.trailing, 20)

                    }
                    HStack {
                        Text("Пароль:")
                            .padding(.leading, 20)
                        Spacer()
                        SecureField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .frame(maxWidth: 200, alignment: .center)
                            .padding(.trailing, 20)

                    }
                }
                Button("Войти") {
                    print("Вход")
                }
                .font(.largeTitle)
                .tint(.blue)
                .cornerRadius(10)
                .disabled(login.isEmpty || password.isEmpty)
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

extension UIApplication { func endEditing() {
sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
} }
