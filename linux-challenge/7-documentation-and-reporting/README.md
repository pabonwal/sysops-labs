# DOCUMENTATION AND REPORTING

### Task
As a final task, outline the steps you would take to keep your team members, supervisors, and stakeholders informed about system status, scheduled maintenance, and any potential issues. Mentioning which structure you would use for documentation.

### Approach
We are working with on-premise servers (physical or virtual)

### Steps
1. Monitoring

    + Zabbix and Elasticsearch to monitoring physical or virtual servers, services, logs and trigger smart alerts by group and role.
    + Integration of Zabbix and Elasticsearch with Slack, Teams or similar communication tools

1. Communication
    
    + Each scheduled mantenance window will require a Method Of Procedure (MOP) in order to get detailed steps of any change to put in production and its rollback process. MOP must be approved by stakeholders and/or supervisors.
    + Each scheduled maintenance window will be coordinated and communicated opportunely by email or the regular company communication tool (Slack, Teams, etc)
    + Initial mail or notification will be sent to all interested persons at the begining of the mw and similar to ending mw, this mail may include the MOP