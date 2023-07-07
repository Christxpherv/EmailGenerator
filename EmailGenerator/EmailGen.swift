import Foundation

/* function to get domains */
func emailDomain() {
    
    var semaphore = DispatchSemaphore (value: 0)
    
    let url = "https://api.apilayer.com/temp_mail/domains"
    var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"
    request.addValue("q9spMv4k1ncXDL5J0jDuwdja1wMj400A", forHTTPHeaderField: "apikey")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data else {
            print(String(describing: error))
            return
        }
        print(String(data: data, encoding: .utf8)!)
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
}
