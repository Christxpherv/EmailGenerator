import SwiftUI

struct InboxView: View {
    
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
                                    /*
                                    FIXME: add refresh functionallity here 
                                    */
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
                                    /*
                                    FIXME: find out how to display specfiic information on each rectangle
                                    */
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
