import SwiftUI
import CryptoKit

struct ContentView: View {
    
    @State var email: String = "no active address"
    @State var test: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Color.blue
                    .frame(height: 100)
                
                Spacer()
                
                    ScrollView() {
                        VStack {
                                /* card that tells the user what their current generated email address is or lack thereof */
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
                                
                                /* button that serves the purpose of generating a random email address or changing an existing one */
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
                                    
                                    /* navigation link that opens InboxView() once the user clicks the inbox button */
                                    NavigationLink(destination: InboxView()) {
                                        RoundedRectangle(cornerRadius: 15)
                                                .frame(width: 182, height: 140)
                                                .foregroundColor(.black)
                                                .overlay(
                                                    VStack {
                                                        customImage(name: "inboxsymbol", size: CGSize(width: 35, height: 35), padding: 15)
                                                        Text("Inbox").textFont()
                                                })
                                    }
                                    
                                    /* button that allows the user to copy and paste their email to their clipboard */
                                    Button(action: {
                                        UIPasteboard.general.string = email
                                        if email == "no active address" {
                                            print("no email to copy found")
                                        }
                                        else if let clipboardContent = UIPasteboard.general.string {
                                            print("Copied to clipboard: \(clipboardContent)")
                                        }
                                        else {
                                            print("Error: unable to copy to clipboard.")
                                        }
                                    }) {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 182, height: 140)
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
}
/* function that generates a random email */
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



/*
 to do list
 
 1) find out how to get one of the random domains from the emailGen view
 2) find out how to set up inbox so that users can delete, refresh, and o
 
 */
