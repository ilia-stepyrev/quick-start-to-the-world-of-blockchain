pragma solidity >=0.4.21 < 0.6.0;

contract ContractWithVasya {
    enum ContractStatus {
        Signed,
        Completed
    }

    struct ContractDetails {
        uint startDate;
        uint daysAmount;
        uint price;
        ContractStatus status;
    }

    event ReservationCompleted (
        uint document
    );

    event ReceiptionConfirmed (
        uint document
    );

    event ReservationCanceled (
        uint document
    );

    event ReservationStatusUpdated (
        uint document
    );


	mapping(address => mapping(address => mapping(uint => ContractDetails))) public contractDetails;

    function reserveMoneyFor(address seller, uint daysAmount, uint documentNumber) public payable returns(bool success) {
        contractDetails[msg.sender][seller][documentNumber] = ContractDetails(now, daysAmount, msg.value, ContractStatus.Signed);
        emit ReservationCompleted (documentNumber);
        return true;
    }

    function confirmReception(address payable seller, uint documentNumber) public returns(bool success) {
        ContractDetails storage details = contractDetails[msg.sender][seller][documentNumber];
        if (details.status == ContractStatus.Completed) {
            return false;
        }

        seller.transfer(details.price);
        emit ReceiptionConfirmed (documentNumber);
        details.status = ContractStatus.Completed;
        emit ReservationStatusUpdated (documentNumber);

        return true;
    }

    function cancelReservation(address seller, uint documentNumber) public returns(bool success) {
        ContractDetails storage details = contractDetails[msg.sender][seller][documentNumber];
        if (details.startDate + details.daysAmount * 1 days > now || details.status == ContractStatus.Completed) {
            return false;
        }

        msg.sender.transfer(details.price);
        emit ReservationCanceled (documentNumber);
        details.status = ContractStatus.Completed;
        emit ReservationStatusUpdated (documentNumber);

        return true;
    }

}
