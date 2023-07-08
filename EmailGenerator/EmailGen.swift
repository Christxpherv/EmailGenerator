import Foundation
import CryptoKit

/* function to get domains */
func emailDomain(completion: @escaping (String?, Error?) -> Void) {
    let url = "https://api.apilayer.com/temp_mail/domains"
    var request = URLRequest(url: URL(string: url)!, timeoutInterval: Double.infinity)
    request.httpMethod = "GET"
    request.addValue("q9spMv4k1ncXDL5J0jDuwdja1wMj400A", forHTTPHeaderField: "apikey")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(nil, error)
            return
        }
        
        guard let data = data else {
            let error = NSError(domain: "com.example.api", code: -1, userInfo: nil)
            completion(nil, error)
            return
        }
        
        do {
            if let domains = try JSONSerialization.jsonObject(with: data, options: []) as? [String] {
                if let randomDomain = domains.randomElement() {
                    completion(randomDomain, nil)
                } else {
                    let error = NSError(domain: "com.example.api", code: -1, userInfo: nil)
                    completion(nil, error)
                }
            } else {
                let error = NSError(domain: "com.example.api", code: -1, userInfo: nil)
                completion(nil, error)
            }
        } catch {
            completion(nil, error)
        }
    }
    
    task.resume()
}

/* function that generates random email */
func EmailGenerator() -> String {
    let uuid = UUID().uuidString
    let data = uuid.data(using: .utf8)!
    let hash = SHA256.hash(data: data)
    let hashString = hash.map { String(format: "%02hhx", $0) }.joined()
    let truncatedHash = String(hashString.prefix(8))
    return "\(truncatedHash)"
}
