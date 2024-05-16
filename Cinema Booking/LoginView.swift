import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var authenticationFailed: Bool = false
    @State private var isUserAuthenticated: Bool = false
    
    let defaultUsername = "admin"
    let defaultPassword = "12345"
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "film")
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .padding()
                
                Text("Cinema Booking Login")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5.0)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5.0)
                
                if authenticationFailed {
                    Text("Incorrect username or password")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button("Log In as Member") {
                    authenticateUser()
                }
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(25)
                .padding(.top, 20)

                Button("Continue as Guest") {
                    continueAsGuest()
                }
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.green)
                .cornerRadius(25)
                .padding(.top, 10)
            }
            .padding()
            .navigationDestination(isPresented: $isUserAuthenticated) {
                MovieSelectionView()
            }
        }
    }
    
    func authenticateUser() {
        if username == defaultUsername && password == defaultPassword {
            authenticationFailed = false
            isUserAuthenticated = true
        } else {
            authenticationFailed = true
            isUserAuthenticated = false
        }
    }
    
    func continueAsGuest() {
        isUserAuthenticated = true
    }
}
