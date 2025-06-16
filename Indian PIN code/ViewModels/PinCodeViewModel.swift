import Foundation
import Combine

@MainActor
class PinCodeViewModel: ObservableObject {
    @Published var postOffices: [PostOffice] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    func clearResults() {
        postOffices = []
        errorMessage = nil
    }
    
    func fetchDetails(for pinCode: String) {
        guard pinCode.count == 6, let url = URL(string: "https://api.postalpincode.in/pincode/\(pinCode)") else {
            self.errorMessage = "Please enter a valid 6-digit PIN code"
            return
        }

        isLoading = true
        errorMessage = nil
        postOffices = []

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode([PINResponse].self, from: data)
                    if let first = decoded.first {
                        if first.status == "Success", let offices = first.postOffice {
                            self?.postOffices = offices
                            self?.errorMessage = nil
                        } else {
                            self?.errorMessage = first.message
                        }
                    } else {
                        self?.errorMessage = "Invalid response format"
                    }
                } catch {
                    self?.errorMessage = "Failed to decode data"
                }
            }
        }.resume()
    }
    
    func validatePinCode(_ pinCode: String) -> Bool {
        let pinCodeRegex = "^[1-9][0-9]{5}$"
        let pinCodePredicate = NSPredicate(format: "SELF MATCHES %@", pinCodeRegex)
        return pinCodePredicate.evaluate(with: pinCode)
    }
} 