import SwiftUI
import CryptoKit

struct ContentView: View {
    
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
                                    print(emailDomain { domain, error in
                                        if let error = error {
                                            print("Error: \(error)")
                                        } else if let domain = domain {
                                            let remail = "\(EmailGenerator())\(domain)"
                                            email = remail
                                            
                                        }
                                    })
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
