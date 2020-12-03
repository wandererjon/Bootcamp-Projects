## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram.jpg](https://github.com/wandererjon/Bootcamp-Projects/blob/main/Diagrams/Network%20Diagram.jpg?raw=true)
These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  - [filebeat config](https://github.com/wandererjon/Bootcamp-Project-1/blob/main/Ansible/filebeat-config.yml)
    [filebeat playbook](https://github.com/wandererjon/Bootcamp-Project-1/blob/main/Ansible/filebeat-playbook.yml)

This document contains the following details:

- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.

- What aspect of security do load balancers protect? 

  **Load Balancers can help protect against distributed denial of service (DDOS) attacks by rerouting the malicious traffic.**
- What is the advantage of a jump box?

  **The largest advantage a jump box provides is that it gives administrative users a secure place to operate.**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the server and system logs.

- What does Filebeat watch for?

  **Filebeat watches for logs files and events.**
- What does Metricbeat record

  **Metricbeat records the container's performance metrics, such as system and service statistics.**

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function   | IP Address | Operating System     |
| -------------------- | ---------- | ---------- | -------------------- |
| Jump-Box-Provisioner | Gateway    | 10.0.0.9   | Linux (Ubuntu 18.04) |
| Web-1                | Web Server | 10.0.0.7   | Linux (Ubuntu 18.04) |
| Web-2                | Web Server | 10.0.0.8   | Linux (Ubuntu 18.04) |
| ELK-VM               | ELK Stack  | 10.1.0.5   | Linux (Ubuntu 18.04) |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:


- **68.231.42.98**

Machines within the network can only be accessed by SSH.

- Which machine did you allow to access your ELK VM? 

  **Web-1**
  
- What was its IP address?

  **10.0.0.7**
  

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
| -------- | ------------------- | -------------------- |
| Jump Box | Yes                 | 68.231.42.98         |
| Web-1    | No                  | 104.42.182.163       |
| Web-2    | No                  | 104.42.182.163       |
| ELK-VM   | No                  | 10.0.0.7             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...


- **The main advantage of automating configuration with Ansible is the fact you don't have to install anything else on the systems you're looking to automate.** 


The playbook implements the following tasks:


- **Step 1: Gain access to the Jump-Box-Provisioner using SSH** 


  ```bash
  $ ssh azadmin@104.42.182.163
  ```


- **Step 2: Gain access into the container**


  ```bash
  azadmin@Jump-Box-Provisioner:~$ sudo docker start zealous_tereshkova
  azadmin@Jump-Box-Provisioner:~$ sudo docker attach zealous_tereshkova
  ```


- **Step 3: Run the YML**


  ```bash
  root@a61a15fa853f:~# cd /etc/ansible/
  root@a61a15fa853f:/etc/ansible# ansible-playbook install-elk.yml
  ```


- **Step 4: Gain access to the ELK-VM**


  ```bash
  root@a61a15fa853f:/etc/ansible# ssh azadmin@10.1.0.5
  ```


- **Step 5: Running docker ps**


  ```bash
  azadmin@ELK-VM:~$ sudo docker ps
  ```


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![dockerps.png](https://github.com/wandererjon/Bootcamp-Projects/blob/main/Diagrams/dockerps.png?raw=true)



### Target Machines & Beats

This ELK server is configured to monitor the following machines:

- List the IP addresses of the machines you are monitoring

  **Web-1; 104.42.182.163**
  
  **Web-2; 104.42.182.163**
  

We have installed the following Beats on these machines:

- Specify which Beats you successfully installed

  **Filebeat & Metricbeat**
  

These Beats allow us to collect the following information from each machine:

- In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see.

- **Filebeat:**

  **The type of data that's collected by Filebeat is log data.**
  
  ![Filebeat.png](https://github.com/wandererjon/Bootcamp-Projects/blob/main/Diagrams/Filebeat.png?raw=true)

- **Metricbeat:**

  **The type of data that's collected by Metricbeat is monitoring data.**
  
  ![metricbeat.png](https://github.com/wandererjon/Bootcamp-Projects/blob/main/Diagrams/metricbeat.png?raw=true)

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the **`*beat-config.yml`** files to **`/etc/ansibles/files`**
- Update the **`*beat-config.yml`** files to include your ELK-VM's private IP.
- Run the playbook, and navigate to **http://[elk.private.ip]:5601/app/kibana** to check that the installation worked as expected.

Answer the following questions to fill in the blanks:

- Which file is the playbook?

  **`filebeat-playbook.yml`  
  `metricbeat-playbook.yml`** 
  
- Where do you copy it?  

  **`/etc/ansible/roles`**
  
- Which file do you update to make Ansible run the playbook on a specific machine? 

  **`/etc/ansible/hosts`**
  
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?

  **in the `/etc/ansible/hosts` file you specify using headers such as [elkservers].**
  
- Which URL do you navigate to in order to check that the ELK server is running?

  http://13.82.143.139:5601/app/kibana
  
