# Tiling Window Manager configuration

## Considerations

### Microsoft Teams presentation blur overlay

To solve the problem of the blurred display when we share screen, we can go to:

```
/usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin
```

After that we can remove or change the file name of the file `rect-overlay`. Something like this:

```shell
sudo rm rect-overlay
```

or

```shell
sudo mv rect-overlay rect-overlay-modified
```
