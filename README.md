# aws_monitoring

markdown
# AWS Infrastructure Monitoring using Terraform, Ansible, Prometheus & Grafana

## Dashboard Preview

### CPU Utilization Dashboard

![CPU Dashboard](screenshots/1st.png)

Real-time CPU utilization monitoring of AWS EC2 instances using Prometheus and Grafana.

---

### Infrastructure Monitoring Dashboard

![Monitoring Dashboard](screenshots/2nd.png)

Displays live infrastructure metrics collected from all monitored EC2 instances.

---

### Performance Dashboard

![Performance Dashboard](screenshots/3rd.png)

Shows real-time server performance metrics including CPU, Memory, Disk, and Network usage.

---
<img width="1567" height="766" alt="image" src="https://github.com/user-attachments/assets/bb819080-b944-4fa0-9ae9-45ad88cbf2d6" />


### AWS Infrastructure


<img width="1915" height="851" alt="image" src="https://github.com/user-attachments/assets/faf3f228-b893-4fe6-bb8b-712d776f4dc2" />


Three AWS EC2 instances were deployed:

- Monitoring Server
- App Server 1
- App Server 2

---

### Terraform Infrastructure Code

![Terraform Code](screenshots/5th.png)

Terraform was used to provision the complete AWS infrastructure automatically.

---

# Project Description

This project demonstrates how to build an automated monitoring solution on AWS using **Terraform**, **Ansible**, **Prometheus**, **Grafana**, and **Node Exporter**.

Terraform provisions the AWS infrastructure, while Ansible automates the installation and configuration of the monitoring stack. Prometheus collects metrics from all EC2 instances, and Grafana provides real-time dashboards for infrastructure monitoring.

---
monitoring-project/
│── ansible.cfg
│── inventory.ini
│── playbook.yml
└── roles/
    ├── node_exporter/
    │   └── tasks/
    │       └── main.yml
    ├── prometheus/
    │   └── tasks/
    │       └── main.yml
    └── grafana/
        └── tasks/
            └── main.yml

# Infrastructure

The environment consists of three AWS EC2 instances.

### Monitoring Server

- Prometheus
- Grafana
- Node Exporter

### App Server 1

- Node Exporter

### App Server 2

- Node Exporter

---

# Technologies Used

- AWS EC2
- Terraform
- Ansible
- Prometheus
- Grafana
- Node Exporter
- Ubuntu Linux

---

# Features

- Infrastructure Provisioning using Terraform
- Automated Configuration using Ansible
- Monitoring of Multiple EC2 Instances
- CPU Utilization Dashboard
- Memory Monitoring
- Disk Usage Monitoring
- Network Monitoring
- Real-time Metrics Collection
- Infrastructure Automation

---

# Monitoring Stack

The Monitoring Server collects metrics from all EC2 instances through Node Exporter.

Prometheus continuously scrapes metrics from every server and stores them in its time-series database.

Grafana connects to Prometheus as a data source and visualizes the collected metrics through interactive dashboards.

---

# Alerting

SMTP email notifications were configured to send alerts whenever CPU utilization exceeded the configured threshold. This enables proactive monitoring and faster response to high resource usage.

---

# Learning Outcomes

This project helped me gain practical experience in:

- Infrastructure as Code (Terraform)
- Configuration Management (Ansible)
- AWS Infrastructure Deployment
- Linux Server Administration
- Prometheus Monitoring
- Grafana Dashboard Creation
- Infrastructure Automation
- Monitoring Best Practices

---

# Author

**Muhammad Shahid**
Devops Engineer
