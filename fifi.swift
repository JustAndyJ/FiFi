
class QueueElement {
    var name: String
    var prev: QueueElement?

    init(name: String) {
        self.name = name
        self.prev = nil
    }
}


class Queue {
    var checkOutCounter: QueueElement?

    func showQueue() {
        print("\nCustomers on CheckOutCounter:")
        var i = 1
        var aux = checkOutCounter

        while let currentElement = aux {
            print("\n   Position : \(i): \(currentElement.name)")
            aux = currentElement.prev
            i += 1
        }

        callMenuQueue()
    }

    func addElementQueue() {
        print("\nType the name of the new client in the queue: ", terminator: "")
      
        if let name = readLine() {
            let client = QueueElement(name: name)

            if checkOutCounter == nil {
              
                checkOutCounter = client
              
            } else {
              
                var aux = checkOutCounter
              
                while aux?.prev != nil {
                  
                    aux = aux?.prev
                }
              
                aux?.prev = client
            }
        }

        callMenuQueue()
    }

    func removeElementQueue() {
        if let servedCustomer = checkOutCounter {
            print("\nCustomer named: \(servedCustomer.name) was served.")

            checkOutCounter = servedCustomer.prev
        }

        callMenuQueue()
    }

    func callMenuQueue() {
    var option = 0

    repeat {
        print("\n\nManager of stock:")
        print("1 - show products.")
        print("2 - add products.")
        print("3 - remove products.")
        print("4 - exit.")
        print("Type the option: ", terminator: "")
        
        if let input = readLine(), let inputOption = Int(input) {
            option = inputOption
        } else {
            print("Invalid input. Please enter a valid option.")
            option = 0
        }
    } while option < 0 || option > 4

    switch option {
    case 1: showQueue()
    case 2: addElementQueue()
    case 3: removeElementQueue()
    default: break
    }
}

}

// Uso de la cola
let queue = Queue()
queue.callMenuQueue()
