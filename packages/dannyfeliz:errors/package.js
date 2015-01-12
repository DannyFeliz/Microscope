Package.describe({
  name: 'dannyfeliz:errors',
  summary: 'A pattern to display application errors to the user',
  version: '1.0.0',
  git: "https://github.com/DannyFeliz/Microscope.git"
});

Package.onUse(function(api,where) {
  api.versionsFrom('1.0.2.1');
  api.use(["minimongo","mongo-livedata","templating"], "client");

  api.addFiles(["errors.coffee","errors_list.html","errors_list.coffee"], "client");

if (api.export)
  api.export("Errors")

});

