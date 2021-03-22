const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default'],
    toastr: 'toastr'
  })
)

const aliasConfig = {
    'jquery': 'jquery/src/jquery',
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);

module.exports = environment
