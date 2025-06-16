import Foundation

struct PINResponse: Codable {
    let message: String
    let status: String
    let postOffice: [PostOffice]?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case postOffice = "PostOffice"
    }
}

struct PostOffice: Codable, Identifiable {
    let id = UUID()
    let name: String
    let branchType: String
    let deliveryStatus: String
    let circle: String
    let district: String
    let division: String
    let region: String
    let state: String
    let country: String
    let pincode: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case branchType = "BranchType"
        case deliveryStatus = "DeliveryStatus"
        case circle = "Circle"
        case district = "District"
        case division = "Division"
        case region = "Region"
        case state = "State"
        case country = "Country"
        case pincode = "Pincode"
    }
} 