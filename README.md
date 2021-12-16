## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![image](https://user-images.githubusercontent.com/87206984/146311159-374bd646-98c7-4b8c-a262-dfbf0b3597ac.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the  filebeat-playbook file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml https://github.com/thiruwoww/Thiru-Azure-Project-/blob/main/Ansible/filebeat-playbook.yml
  - install-elk-playbook.yml https://github.com/thiruwoww/Thiru-Azure-Project-/blob/main/Ansible/install-elk-playbook.yml
  - metricbeat-playbook.yml https://github.com/thiruwoww/Thiru-Azure-Project-/blob/main/Ansible/metricbeat-playbook.yml


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect the Availability, Web traffic, Web security.Load balancers mainly protect from denial-of-service attacks. It will be rerouting the live traffic from one server to another. If a server falls into a DDoS attack server becomes unavailable. In this way, the load balancer helps to eliminate the single-point failure.
  A jump box is a secure computer. sysadmins first connect to before launching any administrative task on other servers. Jump boxes provide controlled access to the servers or VMs holding the applications and help with the management of these hosts.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
- Filebeat used for forward and centralizing log data. It will be installed as agent on the servers. It will monitor the log files in specified location and collect the log files and the events, forward those data to the Elastic search or logstash 
- Metricbeat will monitor the servers by collecting metrics from the system and services running on the server .Basically Metricbeat collect the statistics and metrics it will send to the specified output.

The configuration details of each machine may be found below.


| Name     	| Function 			                   | IP Address 	  			                      | Operating System       |
|---------- |----------------------------------|--------------------------------------------|------------------------|
| JumpT-Box | Gateway With Ansible Container   | Public:-52.149.134.141,Private:- 10.0.0.7  |Ubuntu 18.04 Server LTS |						 
| ELK VMM   | ELK Container & Data Collection  | Public:-20.103.251.242,Private:- 10.1.0.6  |Ubuntu 18.04 Server LTS |
| Web1   	  | DVWA Container ,Web Server       | Private:- 10.0.0.11          	            |Ubuntu 18.04 Server LTS |
| web2     	| DVWA Container ,Web Server       | Private:- 10.0.0.12          	            |Ubuntu 18.04 Server LTS |
| web-3     | DVWA Container ,Web Server       | Private:- 10.0.0.13          	            |Ubuntu 18.04 Server LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Its personal machine 216.209.173.22. But in the rule mention the whole network 216.209.0.0/16. 

Machines within the network can only be accessed by Jumpbox.
- Jumpbox with the IP address 52.149.134.141 with the ansible container can access the Elk server. Private ip 10.0.0.7

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses |
|-----------|---------------------|----------------------|
| JumpT-Box | Yes                 | 216.209.173.22       |
| ELK VMM   | Yes                 | 216.209.173.22       |
| Web1      | No                  | 52.149.134.141       |
| Web2      | No                  | 52.149.134.141       |
| Web-3     | No                  | 52.149.134.141       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- We can  deploy in multiple servers in short time.Main advantage is same configuration can be automated and deployed to multiple machines .Just run the ansible playbook instead of going to every machine and configure individually.This is time consuming and cost effective through Ansible it is not. 

The playbook implements the following tasks:
- Installed the Docker and Ansible on the jumpbox machine.
- Enabling playbook automation to push software services to other machines
- Download and install a Docker elk container
- run command to increase the memory
- List the ports that ELK runs
- Enable service docker on boot
- Download and launch the elk:761 docker web container and allowed the following published ports to be permitted access: 5601:5601 9200:9200 5044:5044
- Run playbook file via ansible-playbook command, therefore pushing task to all machine assigned/configured to receive

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- All the three Web_VMs 10.0.0.11 , 10.0.0.12 , 10.0.0.13

We have installed the following Beats on these machines:
- Filebeat and Metricbeat
- Filebeat
![image](https://user-images.githubusercontent.com/87206984/146306505-2ec1e9c4-9586-4192-8498-e298c7a5eca1.png)

- Metricbeat
![image](https://user-images.githubusercontent.com/87206984/146306485-1714840d-6821-4a6d-a4a9-117a3083ba35.png)

These Beats allow us to collect the following information from each machine:
- Filebeats watches for the change in the files in the specified locations. When the modifications happen in a file it will collect all those data and sends it to Logstash or Elasticsearch. Logs like audit log, deprecation logs, server logs etc.
- Metricbeat collect the metric data from the services and the operating system and send it to the specified output .services like  My SQL ,HA proxy etc. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml and metricbeat-playbook.yml file to /etc/ansible/files.
- Update the /etc/ansible/hosts file to include...
   
[webservers]
- 10.0.0.12 ansible_python_interpreter=/usr/bin/python3

- 10.0.0.11 ansible_python_interpreter=/usr/bin/python3

- 10.0.0.13 ansible_python_interpreter=/usr/bin/python3

[elk]
- 10.1.0.6 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to VM or http://20.104.251.242:5601 to check that the installation worked as expected.

Answer the following questions to fill in the blanks:

 Which file is the playbook? Where do you copy it?
 
- playbook files .yml files are it will run with Ansible. So we need to copy into a container where ansible is installed to deploy.

 Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
 
- The Hosts file allows for grouping of machines so can edit where the resources want  to be deployed. When we group the VM as webservers , ELK stack (filebeat) as elk group through that playbook will install the software’s and the packages 

 Which URL do you navigate to in order to check that the ELK server is running? 
  
  - http://20.104.251.242:5601

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

- sudo docker start [container name]
- sudo docker ps
- sudo docker exec -ti [container name] bash
- sudo ansible-playbook [.yml file to run]
- This command us used to increase the memory "sysctl -w vm.max_map_count=262144" . This improves the performance of Elk server.



