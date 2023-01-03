
# PolyZone Wipe Vehicles

A cool fivem script that allows permitted users to delete all unoccupied vehicles within the argumented zone


## Features

- Multi Zone Compatible
- Extensive Config
- Utalized built in ace permission system
- Only deletes unoccupied vehicles

## Dependencies

- [PolyZone](https://github.com/mkafrin/PolyZone)
## Config Reference

#### Add new Zone

- Use PolyZone's `/pzcreate` (type should be `poly`) and start using `/pzadd` to add points to your PolyZone
- Use `/pzfinish` to finish creating your PolyZone
- Go to your root server directory (typically contains server.cfg)
- Open the `polyzone_created_zones.txt` file
- Inside you should see something along the lines of:
```lua
PolyZone:Create({
  vector2(-675.41241455078, -1102.9605712891),
  vector2(-680.75128173828, -1091.0770263672),
  vector2(-681.77728271484, -1084.6221923828),
  vector2(-686.20330810547, -1078.1710205078),
}, {
  name="yourpolyname",
  --minZ = 13.391509056091,
  --maxZ = 14.918909072876
})
```
- Open the resources `config.lua` and navigate to the `zones` object
- Your new zone should look something like this
```lua
Conig = {
    ...
    zones = {
        ...
        ["yourpolyname"] = {
            vertices = {
                vector2(-675.41241455078, -1102.9605712891),
                vector2(-680.75128173828, -1091.0770263672),
                vector2(-681.77728271484, -1084.6221923828),
                vector2(-686.20330810547, -1078.1710205078),
            },
            options = {
                name = "idk",
                minZ = 13.391509056091,
                maxZ = 14.918909072876
            }
        },
        ...
    }
    ...
}
```
- make sure that your `minZ` and `maxZ` are around a `5+` difference
- enable the `Config.debug` to enable zone debug within the script
## Acknowledgements

 - [Awesome Readme Templates](https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2)
## Support

For support, feel free to dm me on discord `Left#2118`