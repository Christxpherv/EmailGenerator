import SwiftUI

struct InboxView: View {
    
    @State var numEmails: Int = 0
    
    var body: some View {
        
        VStack{
            Color.blue
                .frame(height: 100)
            Spacer()
            
            ScrollView{
                
                if numEmails == 0 {
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 355, height: 150)
                            .overlay(
                                Text("Inbox is empty...")
                                    .textFont()
                            )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 75)
                            .overlay(
                                Button(action: {
                                    // Add your email checking functionality here
                                    print("Refresh button tapped")
                                }) {
                                    Text("Refresh!")
                                        .frame(width: 350, height: 150)
                                        .textFont()
                                }
                            )
                    }
                    .padding(.vertical, 225)
                }
                else {
                    ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))], spacing: 20) {
                                ForEach(0..<numEmails, id: \.self) { emailIndex in
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 375, height: 145)
                                        .overlay(
                                            Text("Email \(emailIndex + 1)")
                                                .textFont()
                                        )
                                }
                            }
                            .padding()
                    }
                }
            }
            Color.blue
                .frame(height: 100)
        }
        .ignoresSafeArea()
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
