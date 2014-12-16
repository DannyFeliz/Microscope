/**
 * Created by danny on 16/12/2014.
 */
var postData = [
  {
    title: "Introduccion Telescrope",
    url: 'http://sachagreif.com/introducing-telescope/',
    comment: "Cool"
  },
  {
    title: "Google Dominicana",
    url: 'https://google.com.do/',
    comment: "Excelent finder"
  },
  {
    title: "Meteor",
    url: 'http://meteor.com/',
    comment: "A very good nodejs framework"
  }

];

Template.postItem.helpers({
  domain: function(){
    var a = document.createElement("a");
    a.href = this.url;
    return a.hostname;
  }
});

Template.postItem.helpers({
  comment: function(){
    var c = this.comment.toUpperCase();
    return c;
  }
});

Template.postsList.helpers({
  posts: postData

});
