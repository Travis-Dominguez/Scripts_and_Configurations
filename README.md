## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Diagrams/RedTeam_ResourceGroup_CloudNetwork.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. 
Alternatively, select portions of the /Ansible playbook files may be used to install certain pieces, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration:
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly stable, in addition to restricting traffic to the network.
Load Balancers distribute traffic evenly across servers. This protects servers from potential DDOS attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the server and system files.
Beats modules allows administrators to finetune their data collection.
For example, filebeat collects data about changes in the file system, while Metricbeat collects data about the running machine such as uptime.

The configuration details of each machine may be found below.
| Name               | Function           | IP Address | Operating System        |
|--------------------|--------------------|------------|-------------------------|
| JumpBoxProvisioner | Gateway            | 10.0.0.4   | Linux: Ubuntu 20.04 LTS |
| Web-1              | Application Server | 10.0.0.5   | Linux: Ubuntu 20.04 LTS |
| Web-2              | Application Server | 10.0.0.6   | Linux: Ubuntu 20.04 LTS |
| Web-3              | Application Server | 10.0.0.7   | Linux: Ubuntu 20.04 LTS |
| ElkServer-VM       | Analytics Server   | 10.1.0.4   | Linux: Ubuntu 20.04 LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 
Only the JumpBoxProvisioner and ElkServer-VM machines can accept connections from the Internet. 
Access to this machines are only allowed from the following IP addresses:
- 'Home-Network-IP'

Machines within the network can only be accessed by the JumpBoxProvisioner and the ElkServer-VM.
From within the RedTeam Resource Group, the ELKServer-Vm can be access by the JumpBoxProvisioner with the help of a Peering functionality.
This allows TCP traffice from 10.0.0.4 to 10.1.0.4 and vice versa.  

A summary of the access policies in place can be found in the table below.
| Name               | Publicly Accessible | Allowed IP Addresses      |
|--------------------|---------------------|---------------------------|
| JumpBoxProvisioner | Yes                 | Home-Network-IP           |
| Web-1              | No                  | 10.0.0.4 10.1.0.4         |
| Web-2              | No                  | 10.0.0.4 10.1.0.4         |
| Web-3              | No                  | 10.0.0.4 10.1.0.4         |
| ElkServer-VM       | Yes                 | Home-Network-IP  10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. 
The configurations were not performed manually, which is advantageous because it creates documentation and allows efficient redeployment of new configurations. 
The playbook implements the following tasks:
- Updates the apt package and installs the following packages:
	docker.io
	python3-pip
	Docker module
- Sets RAM Swap level to 10
- Increases machine's virutal memory usage to 262144
- Downloads and launches elk container with the following paramaters:
	always restarting
	openis ports 5601, 9200, and 5044.
- Ensures docker service is enabled

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
*******************
![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- MetricBeat
- FileBeat

These Beats allow us to collect the following information from each machine:

**********************
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. 
E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

-SSH into the control node.

-Copy the playbook files in the github /Ansible folder to the Ansible directory on your control node. 
/etc/ansible/roles
(Note: You may need to create a roles directory to place all playbook files in).
****************************
-Update the Ansible ansible.config and hosts files to include the private IPs of the elk server and application servers that you are configuring with playbook, IP group name, and remote user. 
(Note: Your elk-server and application servers would be under different IP group names)
nano /etc/Ansible/hosts
nano /etc/Ansible/ansible.config

-Verify that your playbook files have the corresponding IP group names and remote usernames that you updated in the hosts and ansible.config files).
(Note: install-elk.yml will install the elk container to your dedicated elk server, while filebeat-playbook.yml will install to the application servers).

-Run the playbooks
ansible-playbook install-elk.yml
ansible-playbook filebeat-playbook.yml
ansible-playbook metricbeat-playbook.yml

-To verify the creation of the elk server go to your configured elk server's Public IP address using your browser
http://<your.elk-vm.public.ip:5601/app/kibana

