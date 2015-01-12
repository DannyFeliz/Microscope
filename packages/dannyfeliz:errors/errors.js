/**
 * Created by danny on 1/11/15.
 */
Errors ={
    collection: new Mongo.Collection(null),

    throw: function (message){
        Errors.collection.insert({message: message, seen: false})
    }

};