const webpack = require('webpack');

const path = require('path');

const distPath = path.resolve(__dirname, 'dist');

const compiler = webpack([
  {
    entry: './index.js',
    mode: 'production',
    output: {
      filename: 'index.production.js',
      clean: true,
      path: path.resolve(distPath, 'production'),
    },
  },
  {
    entry: './index.js',
    mode: 'development',
    output: {
      filename: 'index.development.js',
      clean: true,
      path: path.resolve(distPath, 'development'),
    },
  },
  {
    entry: './index.js',
    output: {
      filename: 'index.unknown.js',
      clean: true,
      path: path.resolve(distPath, 'unknown'),
    },
  },
]);

// 编译器对象
compiler.run((err, stat) => {
  console.log(err);
});
