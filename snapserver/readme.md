# About

Addon to run snapcast server (snapserver) on hassio.

# Configuration
`args` is the only configuration keyword. Its content gets passed to snapserver. The default is:

``` json
{
  "args": "--stream pipe:///share/snapfifo?name=default"
}
```
This will create a fifo `snapfifo` in the share folder of hassio. If you are on a pi this will be `/share/snapfifo`. On my Arch Linux box it showed up under `/usr/share/hassio/share/snapfifo`.

For more configuration details see [snapcast github](https://github.com/badaix/snapcast#setup-of-audio-playersserver). Just remember, that all of `args` will be passed to snapserver. 
