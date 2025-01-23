# notification_bot
A bot that sends notifications about work done on the server


## Installation
1. Clone the repository

## Open the terminal and run the following commands
1. Create notification_bot.sh file
```bash
touch notification_bot.sh
```
2. Open the file in a text editor
```bash
nano notification_bot.sh
```
3. Copy the following code into loaded file


## Create a service file
1. Create a service file
```bash
sudo nano /etc/systemd/system/notification_bot.service
```
2. Copy the following code into loaded file
```bash
[Unit]

Description=Notification Bot

After=network.target

[Service]

ExecStart=/bin/bash /path/to/notification_bot.sh

Restart=on-failure

RestartSec=5

[Install]

WantedBy=multi-user.target
```

3. Reload the systemd manager configuration
```bash
sudo systemctl daemon-reload
```
4. Start the service
```bash
sudo systemctl start notification_bot
```

5. Enable the service to start on boot
```bash
sudo systemctl enable notification_bot
```

6. Check the status of the service
```bash
sudo systemctl status notification_bot
```