const path = require('path');

module.exports = {
  entry: './root.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname)
  }
};