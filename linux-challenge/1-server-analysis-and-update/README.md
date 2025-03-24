# SERVER ANALYSIS AND UPDATE

### Task
Some of the servers are still running an old version of Ubuntu. You’ll identify these servers, create a plan, and perform an upgrade to the latest stable version of Ubuntu without causing significant downtime.

### Approach
+ I am going to use Ansible and Ansible playbooks in order to do things quick but safe, let’s assume all the nodes have Ansible correctly installed and configured.
+ We are going to plan this release-upgrade in an scheduled maintenance window, in coordination and with approval of affected users areas.
+ I will perform an upgrade for a couple of Ubuntu servers, both having 20.04 LTS version and nginx as webserver and listening by default http port (80/tcp)

### Steps
1. Get the list of Ubuntu servers to release-upgrade, last LTS is 22.04

    We can group these resulting servers in Ansible hosts, so for following steps, we will work with these Ubuntu servers only. Group name will be ubuntuservers.

    ```
    ansible all -a "lsb_release -r" -u root
    ``````

1. Perform backups. Depending of the application we are running on, backup commands can vary significant, i.e: mysqldump, sqlplus, cp, rsync, tar, scp, etc. You can transfer the resulting backup file to a different storage or backup server.

1. Performing some tasks before the release upgrade. 

    ```
    ansible-playbook before-release-upgrade.yml
    ```

1. Performing the release upgrade tasks. 
    ```
    ansible-playbook release-upgrade.yml
    ```

1. Performing some tasks after the release upgrade.
    ```
    ansible-playbook after-release-upgrade.yml
    ```