![acidity](acidity.png)

## About

[Ported from Crystal.](https://github.com/czycha/acidity) Unlike the original Crystal version, does not have a CLI and does not support transparency.

## Requirements

- [Processing v3](https://processing.org/download/)

## Options

Modify the following variables in acidity.pde:
- `RADIUS`: Used internally to produce this effect. Larger numbers take longer, but produce more interesting patterns.
- `IMAGENAME`: The name of the image to load, minus the extension. So the image "drake.png" has the name of "drake".
- `IMAGEEXT`: The extension of the image to load. The image "drake.png" has the extension "png".
- `SAVEME`: Set to `true` in order to save the image. If `ITERATE` is false, saves to "IMAGENAME.acid.IMAGEEXT" (for example, "drake.acid.png"). If `ITERATE` is true, saves frames in the format "IMAGENAME/frame-####.tga" (for example, "drake/frame-0001.tga"). This is best for using Processing's MovieMaker tool to create a movie of your acid trip!
- `ITERATE`: Iteratively acidifies, creating an interesting effect. Paired with `SAVEME`, you can make a movie.

## Contributors

- [James Anthony Bruno](https://github.com/czycha/) - creator, maintainer