const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld", function (accounts) {
  beforeEach(async () => {
    contract = await HelloWorld.new();
  });
  it('need show greetings', async () => {
  const res = await contract.greetings();

  assert(res === "Ola semana solidity!");
  });
});