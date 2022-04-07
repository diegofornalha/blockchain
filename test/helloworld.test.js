const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld", function (accounts) {
  it("should have a message", async function () {
    const helloWorld = await HelloWorld.deployed();
    const message = await helloWorld.message();
    assert.equal(message, "Hello, World!");
  });
}
);