## 1. We use ufw to control access to the server and control access to users on the whitelisted IPs.

## 2. The following commands are used to control access to the server:

## 3. To allow access to the server from a specific IP address:

```bash
sudo ufw allow from <IP_ADDRESS> to any port <PORT_NUMBER>
```

### To deny access to the server from a specific IP address:

```bash
sudo ufw deny from <IP_ADDRESS> to any port <PORT_NUMBER>
```

### To delete a rule from the ufw:

```bash
sudo ufw delete allow from <IP_ADDRESS> to any port <PORT_NUMBER>
```

### To enable the ufw:

```bash
sudo ufw enable
```

### To check the status of the ufw:

```bash
sudo ufw status
```

### To reload the ufw:

```bash
sudo ufw reload
```