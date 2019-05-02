const Path = require('path')
const Webpack = require('webpack')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: {
    app: Path.resolve(__dirname, '../src/index.js')
  },
  output: {
    path: Path.join(__dirname, '../docs'), // gh-pages
    filename: '[name].js'
  },
  // optimization: {
  //   splitChunks: {
  //     chunks: 'all',
  //     name: false
  //   }
  // },
  plugins: [
    new CleanWebpackPlugin(),
    // new CopyWebpackPlugin([
    //   { from: Path.resolve(__dirname, '../public'), to: 'public' }
    // ]),
    new HtmlWebpackPlugin({
      template: Path.resolve(__dirname, '../src/index.html')
    }),
    new Webpack.ProvidePlugin({
      riot: 'riot',
      d3: 'd3'
    })
  ],
  resolve: {
    alias: {
      '~': Path.resolve(__dirname, '../src')
    }
  },
  module: {
    rules: [
      {
        test: /\.mjs$/,
        include: /node_modules/,
        type: 'javascript/auto'
      },
      {
        test: /\.(ico|jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2)(\?.*)?$/,
        use: {
          loader: 'file-loader',
          options: {
            name: '[path][name].[ext]'
          }
        }
      }
    ]
  }
}
