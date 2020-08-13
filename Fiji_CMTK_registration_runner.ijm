#@ File (label = "CMTK library with Munger (directory)", style = "directory") cmtkpath

#@ String (visibility=MESSAGE, value="Input section                                       ", required=false) section1
#@ File (label = "reference brain (file)") refbrain
#@ File (label = "images to register (directory)", style = "directory") sampledir

#@ String (visibility=MESSAGE, value="Output section                                     ", required=false) section2
#@ File (label = "choose a location where your registration directory will be generated (directory)", style = "directory") workdir
#@ String (label = "name your registration, optional", ) name

#@ String (visibility=MESSAGE, value="Operations                                          ", required=false) section3
#@ boolean (label = "Clean up (if you want to keep the xforms don't check this)") clear
#@ boolean (label = "run affine") affine
#@ boolean (label = "run warp") warp
#@ boolean (label = "run reformat") reformat

options = "";

if ((affine==1)&&(warp==1)&&(reformat==1)) 
	operations = "-a -w -r";
	
else if ((affine==0)&&(warp==1)) 
		print("warp needs a calculated affine, try again");

else if ((affine==0)&&(warp==0)&&(reformat==1))
		print("You need affine or affine-warp to run reformat, try again"); 
		
else if ((affine==1)&&(warp==0)&&(reformat==1)){
	operations = "-a -r";
	options = "-l a";
	}
	
else if ((affine==1)&&(warp==1)&&(reformat==0))
		operations = "-a -w";
		
else if ((affine==1)&&(warp==0)&&(reformat==0))
		operations = "-a";	

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
	
#@ String (visibility=MESSAGE, value="Parameters                                       ", required=false) section4
#@ Integer (label="initial exploration step size", value=26) X 
#@ Integer (label="coarsest resampling", value=8) C
#@ Integer (label="Refine grid", value=4) R
#@ Integer (label="grid size(aim for three grid points along the shortest axis)", value=85) G
#@ Float (label="Accuracy", value=0.8) A
#@ Integer (label="Number of compute threads to use", style="slider", min=1, max=128, stepSize=1, value=80) T

getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
datestamp= toString(year,0)+"-"+toString(month,0)+"-"+toString(dayOfMonth,0)+"-"+toString(hour,0)+"-"+toString(minute,0)+"-"+toString(second,0);

exec("sh", "-c", "mkdir -p "+workdir+File.separator+name+"_Registration_"+datestamp+File.separator+"images");

workimagedir = workdir+File.separator+name+"_Registration_"+datestamp+File.separator+"images"+File.separator;

exec("sh", "-c", "cp -r "+sampledir+File.separator+". "+workimagedir+".");

print ("cd "+workdir+File.separator+name+"_Registration_"+datestamp+"; start=`date +%s`; "+cmtkpath+File.separator+"munger -b "+cmtkpath+" "+operations+" "+c1+c2+c3+" "+options+" -X "+X+" -C "+C+" -G "+G+" -R "+R+" -A '--accuracy "+A+"' -W '--accuracy "+A+"'  -v -T 80 -s "+refbrain+" images"+"; end=`date +%s`; echo Execution time was `expr $end - $start` seconds.");
print("Directory structure generated and registration started at "+datestamp);

exec("sh", "-c", "cd "+workdir+File.separator+name+"_Registration_"+datestamp+"; start=`date +%s`; "+cmtkpath+File.separator+"munger -b "+cmtkpath+" "+operations+" "+c1+c2+c3+" "+options+" -X "+X+" -C "+C+" -G "+G+" -R "+R+" -A '--accuracy "+A+"' -W '--accuracy "+A+"'  -v -T 80 -s "+refbrain+" images"+"; end=`date +%s`; echo Execution time was `expr $end - $start` seconds.");

if (clear==1)
exec("sh", "-c", "rm -r "+workdir+File.separator+name+"_Registration_"+datestamp+File.separator+"images"+File.separator+" & rm -r "+workdir+File.separator+name+"_Registration_"+datestamp+File.separator+"Registration");

logdata = getInfo("log");
File.saveString(logdata,workdir+File.separator+name+"_Registration_"+datestamp+File.separator+name+"_"+datestamp+"_log.txt");

#@ String (visibility=MESSAGE, value=".", required=false) dot1
#@ String (visibility=MESSAGE, value="Written by Sandor Kovacs, sandorbx@gmail.com", required=false) msg
#@ String (visibility=MESSAGE, value="Using CMTK by Torsten Rohlfing and Munger by Greg Jefferis ", required=false) msg2
