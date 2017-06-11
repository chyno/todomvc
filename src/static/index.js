// pull in desired CSS/SASS files
require( './styles/main.scss' );
require( './styles/normalize.css' );
require( './styles/skeleton.css' );
//var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
//require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );

//const Elm = require('../elm/App');

//const root = document.getElementById('main');

Elm.App.embed(root);
