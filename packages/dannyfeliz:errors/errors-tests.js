Spies = Munit.spies
describe ("Collection Errors", function(){
        spies.create("throw",Errors,"throw");


    it("Errors - collection works", function(test) {
        expect(Errors.collection.find({}).count()).to.be.equal(0);
        Errors.throw('A new error!');
        expect(Errors.collection.find({}).count()).to.be.equal(1);
        Errors.collection.remove({});
    });


    it("Errors - should add an Error", function(test){
        Errors.collection.remove({});
        Errors.throw("New error");
        var error = Errors.collection.findOne();
        expect(error.message).to.be.equal("New error");
    });


});

