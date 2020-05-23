import Foundation
import Combine
import MatrixClient
import NetworkDispatcher

final class RoomsViewModel: ObservableObject {
    private let client = MatrixClient(baseURL: URL(string:"https://matrix.org")!, dispatcher: DefaultDispatcher())
}
