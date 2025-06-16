import SwiftUI

struct PostOfficeDetailView: View {
    let postOffice: PostOffice
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(postOffice.name)
                .font(.title2)
                .fontWeight(.bold)
            
            DetailRow(title: "Branch Type", value: postOffice.branchType)
            DetailRow(title: "Delivery Status", value: postOffice.deliveryStatus)
            DetailRow(title: "District", value: postOffice.district)
            DetailRow(title: "Region", value: postOffice.region)
            DetailRow(title: "State", value: postOffice.state)
            DetailRow(title: "Division", value: postOffice.division)
            DetailRow(title: "Circle", value: postOffice.circle)
            DetailRow(title: "Country", value: postOffice.country)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
} 