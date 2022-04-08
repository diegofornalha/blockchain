// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract VendingMachine {

    // Declare variáveis ​​de estado do contrato
    address public owner;
    mapping (address => uint) public cupcakeBalances;

    // Quando o contrato 'VendingMachine' é implantado:
    // 1. defina o endereço de implantação como proprietário do contrato
    // 2. defina o saldo de cupcake do contrato inteligente implantado para 100
    constructor() {
        owner = msg.sender;
        cupcakeBalances[address(this)] = 100;
    }

    // Permitir que o proprietário aumente o saldo de cupcake do contrato inteligente
    function refill(uint amount) public {
        require(msg.sender == owner, "Somente o proprietario pode reabastecer.");
        cupcakeBalances[address(this)] += amount;
    }

    // Permitir que qualquer pessoa compre cupcakes
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "Voce deve pagar pelo menos 1 ETH por cupcake");
        require(cupcakeBalances[address(this)] >= amount, "Nao ha cupcakes suficientes em estoque para concluir esta compra");
        cupcakeBalances[address(this)] -= amount;
        cupcakeBalances[msg.sender] += amount;
    }
}
