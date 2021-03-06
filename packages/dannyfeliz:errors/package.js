Package.describe({
  name: 'dannyfeliz:errors',
  summary: 'A pattern to display application errors to the user',
  version: '1.0.0',
  git: "https://github.com/DannyFeliz/Microscope.git"
});

Package.onUse(function(api,where) {
  api.versionsFrom('1.0.2.1');
  api.use(["minimongo","mongo-livedata","templating"], "client");

  api.addFiles(["errors.js","errors_list.html","errors_list.js"], "client");

if (api.export)
  api.export("Errors");

});






Package.onTest(function(api,where){
  api.use(['dannyfeliz:errors',"practicalmeteor:munit","practicalmeteor:sinon"],"client");
  api.use(["tinytest","test-helpers"], "client");

  api.addFiles("errors-tests.js","client");
});
