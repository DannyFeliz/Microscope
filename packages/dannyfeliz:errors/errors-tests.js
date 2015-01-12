Tinytest.add("Errors - collection", function(test) {
    expect(Errors.collection.find({}).count()).to.be.equal(0)
    Errors.throw('A new error!');
    expect(Errors.collection.find({}).count()).to.be.equal(1);

    Errors.collection.remove({});
});

Tinytest.addAsync("Errors - template", function(test, done) {
    Errors.throw('A new error!');
    //test.equal(Errors.collection.find({}).count(), 1);
    expect(Errors.collection.find({}).count()).to.be.equal(1);
    // render the template
    UI.insert(UI.render(Template.meteorErrors), document.body);

    Meteor.setTimeout(function() {
        expect(Errors.collection.find({}).count()).to.be.equal(1);
        done();
    }, 3500);
});