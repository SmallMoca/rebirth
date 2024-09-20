const webpack = require('webpack');
const path = require('path');
const distPath = path.resolve(__dirname, 'dist');

const compiler = webpack({
  entry: './index.js',
  mode: 'development',
  output: {
    iife: true,
    pathinfo: 'verbose',
    path: distPath,
    clean: true,
  },
});

compiler.run((errs, stat) => {
  console.log(errs);
});
