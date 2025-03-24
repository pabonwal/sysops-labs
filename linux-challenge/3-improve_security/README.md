# IMPROVE SECURITY

### Task
The company has faced a few security threats in the past, and you are expected to enhance the system's security.

### Approach 
There are many ways to improve server security, we are going to set the most common

### Steps
1. Enable ufw and allow incoming http traffic only
    ```
    ufw allow 80/tcp
    ufw reload
    ```

1. Change ssh port
    ```
    vim /etc/ssh/sshd_config
    Port 10522
    ```

1. Add rule to 10522/tcp ssh port and delete old 22/tcp rule
    ```
    ufw allow 10522/tcp
    ufw status numbered
    ufw delete 2
    ```
    
1. Disable root login (enable manually this only to use ansible tasks)
    ```
    vim /etc/ssh/sshd_config
    PermitRootLogin no
    ```

1. Install fail2ban
    ```
    sudo apt install fail2ban
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban
    ```