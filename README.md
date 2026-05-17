# syncfilekltn

```
netsh interface portproxy add v4tov4 listenport=80 listenaddress=0.0.0.0 connectport=80 connectaddress=127.0.0.1
netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=443 connectaddress=127.0.0.1
```

```
# Mở cổng 80 cho lưu lượng HTTP
New-NetFirewallRule -DisplayName "Allow HTTP (Port 80)" `
    -Direction Inbound `
    -LocalPort 80 `
    -Protocol TCP `
    -Action Allow `
    -Profile Any `
    -Description "Cho phep luu luong HTTP di vao Traefik"

# Mở cổng 443 cho lưu lượng HTTPS (Let's Encrypt & React Native API)
New-NetFirewallRule -DisplayName "Allow HTTPS (Port 443)" `
    -Direction Inbound `
    -LocalPort 443 `
    -Protocol TCP `
    -Action Allow `
    -Profile Any `
    -Description "Cho phep luu luong HTTPS an toan di vao Traefik"
```
