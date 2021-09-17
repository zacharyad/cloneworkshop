This is a bash script to specify a repo to clone down and a new name for the local folder.
The repo will be cloned to a tmp folder, stripped of its git history, then moved to where the script was run, and finally tearing down the temp folder that was created.

This script should be put in your $PATH so it can be run globally, as clworkshop (or your choice, but for this I will use clworkshop)

- clone or copy just the file cloneworkshop.sh from this repo into  without the .sh (`mv cloneworkshop.sh clworkshop`)
- move this single file into your usr/local/bin (could run somthing like, `mv clworkshop /PATH/TO/usr/local/bin  && cd /PATH/TO/usr/local/bin`
- run `chmod +x clworkshop` within usr/local/bin
- start a new terminal and all is well in the world.
- run the command `clworkshop` in the desired folder you want the repo cloned into.

example use running it inside cohort repo: `clworkshop git@github.com:SomerepoIngithub/Landing-Page-Lobster.git landingPage`

This example will clone the landing page repo into a new folder where you ran the commands called landingPage_solution. The git history will be replace by an initial commit and you can then make changes or whatever before you pushing to make changes visuable to students.










