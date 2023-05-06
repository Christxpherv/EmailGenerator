import SwiftUI
import CryptoKit

struct ContentView: View {
    
    @State var email: String = "No active address"
    
    var body: some View {
        VStack {
            Color.blue
                .frame(height: 100)
            
            Spacer()
            
            ScrollView() {
                VStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 375, height: 300)
                            .overlay(
                                VStack {
                                    customImage(name: "mailsymbol", size: CGSize(width: 125, height: 125), padding: 50)
                                        .fontWeight(.light)

                                    
                                    Text("Email: " + email)
                                        .textFont()
                                }
                            )
                        
                        Button(action: {
                            email = EmailGenerator()
                            print(email)
                        }) {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 375, height: 75)
                                .foregroundColor(.black)
                                .overlay(Text("Change Email").textFont())
                        }
                        HStack {
                            
                            Button(action: {
                                print("hello world")
                            }) {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 182, height: 150)
                                    .foregroundColor(.black)
                                    .overlay(
                                        VStack {
                                            customImage(name: "inboxsymbol", size: CGSize(width: 35, height: 35), padding: 15)
                                            Text("Inbox").textFont()
                                        })
                            }
                            
                            Button(action: {
                                print("hello world")
                            }) {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 182, height: 150)
                                    .foregroundColor(.black)
                                    .overlay(
                                        VStack {
                                            customImage(name: "copynpaste", size: CGSize(width: 35, height: 35), padding: 15)
                                            Text("Copy").textFont()
                                        })
                            }
                        }
                }
            }
            
            Spacer()
            
            Color.blue
                .frame(height: 100)
        }
        .ignoresSafeArea()
    }
}
private func EmailGenerator() -> String {
    let uuid = UUID().uuidString
    let data = uuid.data(using: .utf8)!
    let hash = SHA256.hash(data: data)
    let hashString = hash.map { String(format: "%02hhx", $0) }.joined()
    let truncatedHash = String(hashString.prefix(8))
    return "\(truncatedHash)@example.com"
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
