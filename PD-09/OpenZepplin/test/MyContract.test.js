
const MyContract = artifacts.require('MyContract');
 

contract('MyContract', function () {
  beforeEach(async function () {
   
    this.MyContract = await MyContract.new();
  });
 

  it('retrieve returns a value previously stored', async function () {

    await this.MyContract.store(42);
 
    expect((await this.MyContract.retrieve()).toString()).to.equal('42');
  });
});