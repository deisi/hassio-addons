# About

Addon to run a snapcast client (snapclient) on hassio.

# Configuration
 You must configure a host (the snapcast server, snapserver). Currently its not possible to run DBUS inside of a hassio addon thus autodetection of the server doesn't work. 
 
Example snapclient configuration:

``` json
{
  "host": "name_of_snapcast_server"
}
```
## Options:
You can add arbitrary arguments to snapclient using the `args` keyword:

``` json

{
  "host": "name_of_snapcast_server",
  "args": "string of arguments for snapclient"
}
```

To see the available arguemnts have a look at the snapclient man page
