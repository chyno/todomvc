// pull in desired CSS/SASS files
require( './styles/main.scss' );
require( './styles/normalize.scss' );
require( './styles/skeleton.scss' );

var storedState = localStorage.getItem('elm-todo-save');
var startingState = storedState ? JSON.parse(storedState) : null;
console.log('starting state: ' + startingState);
//var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
//require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var todomvc = Elm.Main.embed( document.getElementById( 'main' ), startingState );


todomvc.ports.setStorage.subscribe(function(state) {
    console.log('...subscribe set storage stae : ' + state)
    localStorage.setItem('elm-todo-save', JSON.stringify(state));
});
//const Elm = require('../elm/App');

//const root = document.getElementById('main');

Elm.App.embed(root);
