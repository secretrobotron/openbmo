require('shelljs/make');

var path = require( "path" );

function nodeExec(p){return 'node "' + p + '"';}

const CSS_DIR = './css';
const LESS = nodeExec('./node_modules/less/bin/lessc');
const MAIN_LESS = CSS_DIR + '/style.less';
const MAIN_CSS = CSS_DIR + '/style.css';

function compileCSS(){
  var result = exec(LESS + ' ' + MAIN_LESS, {silent:true});

  if(result.code === 0){
    var css = result.output;
    css.to(MAIN_CSS);
  } else {
    echo(result.output);
  }
}

target.all = function(){
  compileCSS();
};