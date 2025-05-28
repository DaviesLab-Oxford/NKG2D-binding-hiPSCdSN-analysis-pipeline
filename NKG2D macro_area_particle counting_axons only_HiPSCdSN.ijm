'Since only the ROI with axons was imaged, the codes for excluding soma are not required here.'

dir = getDirectory("select 'Original images' dir");
list = getFileList(dir);


dir2 = getDirectory("select 'NKG2D_drawing particles' folder"); 

for(a=0; a<list.length; a++) 

{
path = dir + list[a];
run("Viewer", "open=[path]"); 'In this experiment, all the images were taken by an Olympus Spining Disk microscope. The plugin Olympus Viewer is installed on Fiji for openning the .vsi files' 
wait(50);
imageTitle=getTitle();
	
selectImage(imageTitle);
run("Z Project...", "projection=[Max Intensity]");
run("Split Channels");
selectImage(imageTitle);
close;
	
selectWindow("C4-MAX_"+imageTitle);
new_name=replace(imageTitle, "Group:1 Level:1 Area:1", "");
rename("C4-MAX_"+new_name);
selectWindow("C2-MAX_"+imageTitle);
new_name=replace(imageTitle, "Group:1 Level:1 Area:1", "");
rename("C2-MAX_"+new_name);


selectWindow("C4-MAX_"+new_name);
run("8-bit");
setThreshold(30, 255, "raw"); 'Adjusting threshold according to your own data'
run("Create Selection");

if (selectionType()>-1)
{
run("Enlarge...", "enlarge=0.5");
run("Make Inverse");

selectWindow("C2-MAX_"+new_name);
run("Restore Selection");
run("Clear", "slice"); 'Deleting BtubIII-negative area from each image. Only counting particles within BtubIII-positive axons'
run("Select None");

selectWindow("C4-MAX_"+new_name);
run("Clear", "slice"); 'Deleting BtubIII-negative area from each image. Only measuring area of BtubIII-positive axons'
run("Select None");

selectWindow("C2-MAX_"+new_name);
run("8-bit");

setThreshold(23, 255, "raw"); 'Adjusting threshold according to your own data'
run("Create Selection");
run("Analyze Particles...", "size=0.1-25 circularity=0-1.00 show=[Bare Outlines] summarize stack");
selectWindow("Drawing of C2-MAX_"+new_name);
saveAs("Tiff", dir3+"Drawing of C2-MAX_"+new_name);
close();
	
	
selectWindow("C4-MAX_"+new_name);
run("Create Selection");
roiManager("Add");
roiManager("Select", 0);
roiManager("Rename", "BtubIII");
roiManager("Measure");
run("Enlarge...", "enlarge=0.5");
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "BtubIII enlarged");
roiManager("Measure");

selectWindow("C2-MAX_"+new_name);
roiManager("Select", 1);
run("Analyze Particles...", "size=0.1-25 circularity=0.00-1.00 include summarize");


roiManager("Deselect");
roiManager("Delete");
selectWindow("C1-MAX_"+imageTitle);
close("C1-MAX_"+imageTitle);
selectWindow("C2-MAX_"+new_name);
close("C2-MAX_"+new_name);
selectWindow("C3-MAX_"+imageTitle);
close("C3-MAX_"+imageTitle);
selectWindow("C4-MAX_"+new_name);
close("C4-MAX_"+new_name);
selectWindow(imageTitle2);
close(imageTitle2);
}

else {

selectWindow("C1-MAX_"+imageTitle);
close("C1-MAX_"+imageTitle);
selectWindow("C2-MAX_"+new_name);
close("C2-MAX_"+new_name);
selectWindow("C3-MAX_"+imageTitle);
close("C3-MAX_"+imageTitle);
selectWindow("C4-MAX_"+new_name);
close("C4-MAX_"+new_name);
selectWindow(imageTitle2);
close(imageTitle2);
}
}
