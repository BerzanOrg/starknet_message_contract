#[starknet::contract]
mod Contract {
    use core::starknet::event::EventEmitter;
    use starknet::{get_caller_address, ContractAddress};

    #[storage]
    struct Storage {
        last_message: felt252,
        last_sender: ContractAddress,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Update: Update,
    }

    #[derive(Drop, starknet::Event)]
    struct Update {
        sender: ContractAddress,
        message: felt252,
    }


    #[external(v0)]
    fn get(self: @ContractState) -> (felt252, ContractAddress) {
        (self.last_message.read(), self.last_sender.read())
    }

    #[external(v0)]
    fn update(ref self: ContractState, new_message: felt252) {
        let caller_address = get_caller_address();
        self.last_message.write(new_message);
        self.last_sender.write(caller_address);
        self.emit(Update { sender: caller_address, message: new_message })
    }
}
