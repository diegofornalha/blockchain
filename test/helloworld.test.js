const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld", function (accounts) {
  beforeEach(async () => {
const res = await contract.greetings();
assert(res == "Hello World!");
  });
});