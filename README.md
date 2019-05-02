# grand-theft-europe-viz

A small data-game to get a feeling for 50 billion euro, used for the [Grand
Theft Europe](http://grand-theft-europe.com)-Investigation by
[CORRECTIV](https://correctiv.org) and 35 european media partners.

Build with [d3js](https://d3js.org) and [riot.js](https://riot.js.org)

[preview](https://correctiv.github.io/grand-theft-europe-viz/)

## usage

How to include in article: Load css & js and insert a `<div>`-element as
described below:

**FIXME: put assets somewhere else ("github is not a CDN")**

https://correctiv.github.io/grand-theft-europe-viz/gte-viz.js

https://correctiv.github.io/grand-theft-europe-viz/gte-viz.css

### European Data, 50 Bln., language: English

```html
<div class="gteviz-wrapper" data-mount="gteviz" data-lang="en" data-scope="eu"></div>
```

### European Data, 50 Bln., language: German

```html
<div class="gteviz-wrapper" data-mount="gteviz" data-lang="de" data-scope="eu"></div>
```

### German Data, 14 Bln., language: German

```html
<div class="gteviz-wrapper" data-mount="gteviz" data-lang="de" data-scope="de"></div>
```



based on this starterkit by [webkid](http://github.com/wbkd/):

# Webpack Frontend Starterkit

A lightweight foundation for your next webpack based frontend project.


### Installation

```
npm install
```

### Start Dev Server

```
npm start
```

### Build Prod Version

```
npm run build
```

### Features:

* ES6 Support via [babel](https://babeljs.io/) (v7)
* SASS Support via [sass-loader](https://github.com/jtangelder/sass-loader)
* Linting via [eslint-loader](https://github.com/MoOx/eslint-loader)

When you run `npm run build` we use the [mini-css-extract-plugin](https://github.com/webpack-contrib/mini-css-extract-plugin) to move the css to a separate file. The css file gets included in the head of the `index.html`.
