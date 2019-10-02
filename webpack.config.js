// webpack.config.js
// ...
var Encore = require('@symfony/webpack-encore');

Encore.configureRuntimeEnvironment('dev');

Encore

    // directory where compiled assets will be stored
    .setOutputPath('web/build/')
    // public path used by the web server to access the output path
    .setPublicPath('/web')

    .cleanupOutputBeforeBuild()

    .addEntry('app', './assets/js/app.js')
    .enableSourceMaps(!Encore.isProduction())

    
    .enableVueLoader()
;

module.exports = Encore.getWebpackConfig();