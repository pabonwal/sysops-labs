# AUTOMATE ROUTINE TASKS

### Task
You’ll need to create a routine task to automatically update all the software packages on these servers.

### Approach
By default, unattended-upgrades package is installed at Ubuntu modern releases

### Steps
1. Let's enable unattended-upgrades (select Yes to enable)
    ```
    sudo dpkg-reconfigure -plow unattended-upgrades
    ```

1. Set a cron job to automate unattended-unattended execution (02:00)
    ```
    sudo crontab -e
    0 2 * * * sudo /usr/bin/unattended-upgrade -v
    ```

1. Add nginx to blacklist section (it will not be upgraded)
    ```
    vim /etc/apt/apt.conf.d/50unattended-upgrades
    ```