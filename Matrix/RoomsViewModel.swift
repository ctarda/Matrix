import Foundation
import Combine
import MatrixClient
import NetworkDispatcher

final class RoomsViewModel: ObservableObject {
    private let client = MatrixClient(baseURL: URL(string:"https://matrix.org")!, dispatcher: DefaultDispatcher())
    
    var objectWillChange = PassthroughSubject<RoomsViewModel, Never>()
    
    private(set) var rooms = [Room]() {
        didSet {

            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    
    init() {
        getRooms()
    }
    
    func getRooms() {
        let _ = client.publicRooms().print().sink(receiveCompletion: {_ in }, receiveValue: {print($0)})
    }
}
