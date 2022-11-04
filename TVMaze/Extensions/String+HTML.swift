import Foundation

extension String {
    var htmlToString: String? {
        let data = Data(utf8)
        do {
            let attributedString = try NSAttributedString(data: data,
                                                          options: [
                                                            .documentType: NSAttributedString.DocumentType.html,
                                                            .characterEncoding: String.Encoding.utf8.rawValue
                                                          ],
                                                          documentAttributes: nil)
            return attributedString.string
        } catch {
            print(error)
            return nil
        }
    }
}
