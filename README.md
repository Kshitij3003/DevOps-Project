# :heart: ImageSketchMakeover :heart: [![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

A minimalistic computer vision based Web application that makes use of some blurring and image blending (dodging and burning) techniques to generate pencil sketch like output for any image fed as input.
## Live app available [here.](https://imagesketchmakeover.herokuapp.com/)

![](https://user-images.githubusercontent.com/29462447/90712398-92a35f80-e2c0-11ea-8fe2-031a7e67a0bc.jpg)
![](https://user-images.githubusercontent.com/29462447/90712401-946d2300-e2c0-11ea-8312-b44e033bb413.jpg)


### Installation:
Simply run the command: ***pip install -r requirements.txt** 

### Normal Usage:
1. Clone this Repository to a directory and navigate to that directory.
2. Run the command: ***python app.py***
3. This will run the web-app on localhost and would look something like this. Feel free to play around with the codes, add more features, beautify it. :wink:

![1](https://user-images.githubusercontent.com/29462447/90712408-959e5000-e2c0-11ea-876f-db71875fe0bd.png)
![2](https://user-images.githubusercontent.com/29462447/90712409-9636e680-e2c0-11ea-9b82-a7848403d54c.png)

### CI/CD Flow:
![](https://raw.githubusercontent.com/Kshitij3003/DevOps-Project/master/Final%20Diagram.drawio%20(1).png)
1. Fork this GitHub repository into your GitHub account.
2. Install Terraform in your local machine or on vitrual machine using the <a href="https://k21academy.com/terraform-iac/terraform-installation-overview/">link.</a>
3. Create a directory and keep all the files of Project folder inside it.
4. Create a security group in the region of your desire with HTTP,HTTPS,ALL TCP, and ALL TRAFFIC having values ANYWHERE. And assign the security group id inside your terraform file to "vpc_security_group_ids". Check the region in which your security group is and set the region and availability zone as per it.
5. Now run commands as one after another. Terraform init -> Terraform Validate -> Terraform Plan -> Terraform Apply
6. After running Terraform Apply just wait for minutes to have instance prepared. And as the instance get prepared, access your JENKINS using MASTER PUBLIC IP ADDRESS:8080. (If output is not comming then plz wait as it will take sometime)
7. Copy and paste the password for JENKINS from the file which is mentioned on the UI of jenkins. Now select Install Suggested Plugins and set your username and password.
8.  Now you need to allow TCP connection to RANDOM inside JENKINS-MANAGE JENKINS-GLOBAL CONFIGURATION.
9.  Now connect your ndoe1 using ssh and install JAVA in it.
10. Now go to JENKINS then <b>MANAGE JENKINS-MANAGE NODES- ADD NODES</b>. Download file mention in Jenkins nodes namely (agent.jar and jenkins-agent.jnlp(cick on launch)).
11. Copy the command mentioned there and paster it on the node1 and run it.
12. Repeat steps 8-10 for K8Master and Heroku instance.
13. Now got to dashboard and build your first job named as <b>GitHub</b>.Refer images in GitHub-GitHub Job images. And in post build select select "Build Other Project" and type Test in it and save.
14. Now go to <b> Manage Jenkins -> Plugins -> Available -> Ansible -> Install without restart</b>.
 15. Now got to dashboard and build your second job named as <b>Test</b>.And if you are familiar with the testing part then add test part in it or leave it simple and save. And in post build select select "Build Other Project" and type DockerHub in it and save.
 16. Now got to dashboard and build your third job named as <b>DockerHub</b>.Refer images in GitHub-DockerHub Job images. And use your username and password after "-u" and "-p". And in post build select "Build Other Project" and type Kubernetes in it and save.
 17. Now got to dashboard and build your fourth job named as <b>Kubernetes</b>.Refer images in GitHub-Kubernetes Job images. And in post build select "Build Other Project" and type Heroku in it and save.
17. Now got to dashboard and build your fourth job named as <b>Heroku</b>.Refer images in GitHub-Heroku Job image.
18. Now go to <b> Manage Jenkins -> Plugins -> Available -> Build Pipeline -> Install</b> without restart.
19. Go to dashboard and build UI for pipeline as seen in image insine GitHub-pipeline images.
20. Now build GitHub jobe and enjoy the continuous integration and deployment.
 

### Deployment on Heroku:
1. Create the **Aptfile**, **Procfile**, **requirements.txt** and **runtime.txt** accordingly.
  * **Aptfile** - Acts as support for apt-based dependencies during both compile and runtime.
  * **Procfile** - Heroku apps include a Procfile that specifies the commands that are executed by the app on startup. You can use a Procfile to declare a variety of process types, like your app’s web server, multiple types of worker processes, a singleton process, such as a clock etc.
  * **requirements.txt** - This comprises of the list of all necessary python packages needed for running the web-app. Create this by: ***pip freeze > requirements.txt***
  * **runtime.txt** - specifies the Python version which was used for building the application.

3. Upload your entire web-app on github as a fresh github repository ___just the way I did here___ :smile:
4. Sign up/Sign in to your Heroku Account and choose **Create App**, provide the **app name**.
5. Go to the **deploy** tab and link your Heroku app to your GitHub repo where the webapp is located.
6. After linking , go to settings tab, scroll down to add buildpack and add the following buildpacks:
  * https://github.com/heroku/heroku-buildpack-apt.git
  * Choose **Python** buildpack from the icons as well.

7. **Save Changes.** Go to the deploy tab and deploy you app and you’re done!.

<hr>
<b>NOTE:</b>
 *  Ensure your entire web app folder structure is maintained in the same format as you see here ( as in case of Flask ).
<hr>
