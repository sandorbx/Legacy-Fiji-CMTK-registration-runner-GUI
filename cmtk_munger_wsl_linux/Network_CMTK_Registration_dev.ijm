#@ File (label = "reference brain") refbrain
#@ File (label = "choose a location where your reg directory will be generated", style = "directory") workdir
#@ File (label = "images to register", style = "directory") sampledir
#@ String (label = "name your registration!", ) name

#@ boolean (label = "run affine") affine
#@ boolean (label = "run warp") warp
@ boolean (label = "run reformat") reformat

if (affine==1)
	a = "-a ";
else 
	a = "";

if (warp==1)
	w = "-w ";
else 
	w = "";

if (reformat==1)
	r = "-r ";
else 
	r = "";

#@ boolean (label = "reformat channel 01") rx1
#@ boolean (label = "reformat channel 02") rx2
#@ boolean (label = "reformat channel 03") rx3

if (rx1==1)
	c1 = "01";
else 
	c1 = "";

if (rx2==1)
	c2 = "02";
else 
	c2 = "";

if (rx3==1)
	c3 = "03";
else 
	c3 = "";

#@ Integer (label="initial exploration step size", value=26) X 
#@ Integer (label="coarsest resampling", value=8) C
#@ Integer (label="Refine grid", value=4) R
#@ Integer (label="grid size(aim for three grid points along the shortest axis", value=85) G
#@ Float (label="Accuracy", value=0.8) A
#@ Integer (label="Number of compute threads to use", style="slider", min=1, max=80, stepSize=1, value=80) T
=
exec("sh", "-c", "mkdir -p "+workdir+File.separator+name+"Registration"+File.separator+"images");

samplepath = workdir+File.separator+name+"Registration"+File.separator+"images"+File.separator;

exec("sh", "-c", "cp -r "+sampledir+File.separator+". "+samplepath+".");

command = File.separator+"Registration"+File.separator+"bin"+File.separator+"cmtk"+File.separator+"munger -b ~"+File.separator+"Registration"+File.separator+"bin"+File.separator+"cmtk "+a+w+r+" "+c1+c2+c3+"  -X "+X+" -C "+C+" -G "+G+" -R "+R+" -A '--accuracy "+A+"' -W '--accuracy "+A+"'  -v -T 80 -s "+refbrain+" images";

exec("sh", "-c", "cd "+workdir+File.separator+name+"Registration; start=`date +%s`; ~"+command+"; end=`date +%s`; echo Execution time was `expr $end - $start` seconds.");

#@ String (visibility=MESSAGE, value=".", required=false) dot1
#@ String (visibility=MESSAGE, value="Written by Sandor Kovacs, sandorbx@gmail.com", required=false) msg
