# Feed-The-Beast Academy (Modded Minecraft 1.12) in Docker
To pull the image:
```
docker pull audiohacked/ftb_academy:stable
```

It's highly recommended run a named data volume:
```
docker volume create minecraft_ftb_academy_data
docker volume create minecraft_ftb_academy_backups
```

Then, run the server container:
```
docker run --detach --interactive --tty \
    --name ftb_academy \
    --volume minecraft_ftb_academy_data:/minecraft/world \
    --volume minecraft_ftb_academy_backups:/minecraft/backups \
    --publish 25565:25565 \
    --env EULA=TRUE \
    audiohacked/ftb_academy:stable
```
