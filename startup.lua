--config
do
delay1=1--on button
delay2=1.2--inter transit
engine="bottom"
wheel="top"--NO to disable
side="back"
ff=colors.white
lux=colors.orange
end
--functions
function rwr (dx,dy,dz,df,dl)--rewrite persistence file data
pcall(fs.delete,"data")
dat = fs.open("data","w")
dat.writeLine("x="..dx)
dat.writeLine("y="..dy)
dat.writeLine("z="..dz)
dat.writeLine("f="..df)
dat.writeLine("l="..dl)
dat.close()
end
function tbright()--term color black/l.blue
if term.isColor() then
term.setTextColor(colors.black)
term.setBackgroundColor(colors.lightBlue)
end
end
function tdark()--term color blue/black
if term.isColor() then
term.setTextColor(colors.blue)
term.setBackgroundColor(colors.black)
end
end
function tclick()--term color white/blue
if term.isColor() then
term.setTextColor(colors.white)
term.setBackgroundColor(colors.blue)
end
end
function bdraw()--draws button blanks
tbright()
i=4
for j=5,7 do
term.setCursorPos(i,j)
term.write("    ")
term.setCursorPos(i,j+5)
term.write("    ")
term.setCursorPos(i,j+10)
term.write("    ")
end
i=11
for j=5,7 do
term.setCursorPos(i,j)
term.write("    ")
term.setCursorPos(i,j+5)
term.write("    ")
term.setCursorPos(i,j+10)
term.write("    ")
end
i=18
for j=5,7 do
term.setCursorPos(i,j+0)
term.write("    ")
term.setCursorPos(i,j+5)
term.write("    ")
term.setCursorPos(i,j+10)
term.write("    ")
end
end
function bnames()--draws button names
tbright()
i=4
term.setCursorPos(i,6)
term.write(" Up ")
term.setCursorPos(i,11)
term.write(" W  ")
term.setCursorPos(i,16)
term.write(" FF ")
i=11
term.setCursorPos(i,6)
term.write(" N  ")
tdark()
term.setCursorPos(i,10)
term.write("    ")
term.setCursorPos(i,11)
term.write("    ")
term.setCursorPos(i,12)
term.write("    ")
tbright()
term.setCursorPos(i,16)
term.write(" S  ")
i=18
term.setCursorPos(i,6)
term.write(" Li ")
term.setCursorPos(i,11)
term.write(" E  ")
term.setCursorPos(i,16)
term.write(" Do ")
end
function btransit()--draws transit button names
tbright()
i=4
term.setCursorPos(i,6)
term.write(" +X ")
term.setCursorPos(i,11)
term.write(" 0X ")
term.setCursorPos(i,16)
term.write(" -X ")
i=11
term.setCursorPos(i,6)
term.write(" +Y ")
term.setCursorPos(i,10)
term.write("    ")
term.setCursorPos(i,12)
term.write("    ")
term.setCursorPos(i,11)
term.write(" 0Y ")
term.setCursorPos(i,16)
term.write(" -Y ")
i=18
term.setCursorPos(i,6)
term.write(" +Z ")
term.setCursorPos(i,11)
term.write(" 0Z ")
term.setCursorPos(i,16)
term.write(" -Z ")
end
function bcheck(to,bpx,bpy,bsx,bsy,xP,yP,draw)--just check and draw clicks
if xP>=bpx and xP<bpx+bsx and yP>=bpy and yP<bpy+bsy then
if draw==1 then 
tclick()
for i=bpx,bpx+bsx-1 do
for j=bpy,bpy+bsy-1 do
if to==1 then
term.setCursorPos(i,j)
term.write(" ")
else
m.setCursorPos(i,j)
m.write(" ")
end
end
end
end
return true 
else return false end
end
function bf(statef)--draws FF button
if statef==1 then
tclick()
term.setCursorPos(4,15)
term.write("    ")
term.setCursorPos(4,16)
term.write(" FF ")
term.setCursorPos(4,17)
term.write("    ")
else
tbright()
term.setCursorPos(4,15)
term.write("    ")
term.setCursorPos(4,16)
term.write(" FF ")
term.setCursorPos(4,17)
term.write("    ")
end
end
function bl(statel)--drwas Lux button
if statel==1 then
tclick()
term.setCursorPos(18,5)
term.write("    ")
term.setCursorPos(18,6)
term.write(" Li ")
term.setCursorPos(18,7)
term.write("    ")
else
tbright()
term.setCursorPos(18,5)
term.write("    ")
term.setCursorPos(18,6)
term.write(" Li ")
term.setCursorPos(18,7)
term.write("    ")
end
end
function bt(statet)--draws trasit button
if statet==0 then
tbright()
term.setCursorPos(31,5)
term.write("                  ")
term.setCursorPos(31,6)
term.write("    To transit    ")
term.setCursorPos(31,7)
term.write("                  ")
elseif statet==1 then
tclick()
term.setCursorPos(31,5)
term.write("                  ")
term.setCursorPos(31,6)
term.write("    In transit    ")
term.setCursorPos(31,7)
term.write("                  ")
elseif statet==2 then
tbright()
term.setCursorPos(31,5)
term.write("                  ")
term.setCursorPos(31,6)
term.write("   Transit  OFF   ")
term.setCursorPos(31,7)
term.write("                  ")
else
tclick()
term.setCursorPos(31,5)
term.write("                  ")
term.setCursorPos(31,6)
term.write("   Transit  OFF   ")
term.setCursorPos(31,7)
term.write("                  ")
end
end
function drawt(arg)--draws transit gui
if arg==1 then
tbright()
for i=31,44 do
for j=9 ,17 do
term.setCursorPos(i,j)
term.write(" ")
end
end
for i=45,48 do
for j=9 ,17 do
term.setCursorPos(i,j)
term.write(" ")
end
end
tbright()
term.setCursorPos(32,10)
term.write("Axis Value")
tdark()
term.setCursorPos(32,12)
term.write("X=        ")
term.setCursorPos(32,14)
term.write("Y=        ")
term.setCursorPos(32,16)
term.write("Z=        ")
tbright()
term.setCursorPos(45,10)
term.write("A-+")
tdark()
term.setCursorPos(45,12)
term.write("Xsn")
term.setCursorPos(45,14)
term.write("Ydu")
term.setCursorPos(45,16)
term.write("Zwe")
elseif arg==0 then
tdark()
for i=31,44 do
for j=9 ,18 do
term.setCursorPos(i,j)
term.write(" ")
end
end
for i=45,48 do
for j=9 ,18 do
term.setCursorPos(i,j)
term.write(" ")
end
end
elseif arg==2 then
tdark()
term.setCursorPos(32,12)
term.write("X=        ")
term.setCursorPos(32,14)
term.write("Y=        ")
term.setCursorPos(32,16)
term.write("Z=        ")
end
end
function bc(statec)
if statec==1 then

tbright()
for i=24,28 do
for j=7 ,15 do
term.setCursorPos(i,j)
term.write(" ")
end
end
else

tdark()
for i=24,28 do
for j=7 ,15 do
term.setCursorPos(i,j)
term.write(" ")
end
end
end
end
function blockmon()
if wheel=="NO" then
else
if m.isColor() then
m.setBackgroundColor(colors.blue)
end
m.setCursorPos(1,1)
m.write("     ")
m.setCursorPos(1,2)
m.write(" ")
m.setCursorPos(5,2)
m.write(" ")
m.setCursorPos(1,3)
m.write("     ")
if m.isColor() then
m.setBackgroundColor(colors.black)
end
m.setCursorPos(2,2)
m.write("   ")
end
end
function drawmon()
if wheel=="NO" then
else
if x==0 and y==0 and z==0 then
if m.isColor() then
m.setTextColor(colors.lightBlue)
m.setBackgroundColor(colors.black)
end
m.setCursorPos(1,1)
m.write("U N L")
m.setCursorPos(1,2)
m.write(" W E ")
m.setCursorPos(1,3)
m.write("F S D")
if m.isColor() then
m.setBackgroundColor(colors.black)
end
m.setCursorPos(2,1)
m.write(" ")
m.setCursorPos(4,1)
m.write(" ")
m.setCursorPos(1,2)
m.write(" ")
m.setCursorPos(3,2)
m.write(" ")
m.setCursorPos(5,2)
m.write(" ")
m.setCursorPos(2,3)
m.write(" ")
m.setCursorPos(4,3)
m.write(" ")
if m.isColor() then
m.setTextColor(colors.white)
m.setBackgroundColor(colors.blue)
end
if f==1 then 
m.setCursorPos(1,3)
m.write("F")
end
if l==1 then
m.setCursorPos(5,1)
m.write("L")
end
else
if m.isColor() then
m.setBackgroundColor(colors.lightBlue)
end
m.setCursorPos(1,1)
m.write("     ")
if m.isColor() then
m.setTextColor(colors.blue)
m.setBackgroundColor(colors.black)
end
m.setCursorPos(1,2)
m.write("STOP!")
if m.isColor() then
m.setBackgroundColor(colors.lightBlue)
end
m.setCursorPos(1,3)
m.write("     ")
end
end
end
function click()
while true do--clickloop 3
event, button, xPos, yPos = os.pullEvent()
if (button==1 and event=="mouse_click") or event=="monitor_touch" then break end
end
if event=="mouse_click"   and bcheck(1,31,5 ,18,3,xPos,yPos,0) then bt(3) x=0 y=0 z=0 rwr(x,y,z,f,l) shell.run("startup") end
if event=="monitor_touch" and bcheck(0,1 ,1 ,5 ,3,xPos,yPos,0) then bt(3) x=0 y=0 z=0 rwr(x,y,z,f,l) shell.run("startup") end
end
function wait()
sleep(0.5)
return true
end
--do stuff
if wheel==0 then--wheel init
else
m=peripheral.wrap(wheel)
m.setTextScale(1.5)
end
if fs.exists("data") then shell.run("data")--load persistence
else x=0 y=0 z=0 f=0 l=0 rwr(x,y,z,f,l) end
do--term init
sizex,sizey=term.getSize()
tdark()--darken the screen
term.clear()
term.setCursorPos(sizex/2-18,1)
term.write("TeCraft the future of transportation")
end
do--makes the border
tbright()
for i=1,sizex do
term.setCursorPos(i,3)
term.write(" ")
term.setCursorPos(i,sizey)
term.write(" ")
end
for i=4,sizey do
term.setCursorPos(1,i)
term.write(" ")
term.setCursorPos(sizex,i)
term.write(" ")
end
end
rs.setBundledOutput(side,lux*l+ff*f)--FF and light init
eng=peripheral.wrap(engine)--Engine wrapping
drawmon()--monitor drawing at init
if x==0 and y==0 and z==0 then--if persistence is zero
bdraw()
bnames()
bt(0)
bf(f)
bl(l)
while true do--main loop - non transiting mode
while true do--clickloop 1
event, button, xPos, yPos = os.pullEvent()
if (button==1 and event=="mouse_click") or event=="monitor_touch" then break end
end
if event=="mouse_click" then
if     bcheck(1,4 ,15,4 ,3,xPos,yPos,0) then if f==0 then f=1 else f=0 end rs.setBundledOutput(side,ff*f+lux*l) rwr(x,y,z,f,l) bf(f) drawmon()--FF
elseif bcheck(1,18,5 ,4 ,3,xPos,yPos,0) then if l==0 then l=1 else l=0 end rs.setBundledOutput(side,ff*f+lux*l) rwr(x,y,z,f,l) bl(l) drawmon()--lux
elseif bcheck(1,4 ,5 ,4 ,3,xPos,yPos,1) then eng.move(1,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,18,15,4 ,3,xPos,yPos,1) then eng.move(0,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,11,5 ,4 ,3,xPos,yPos,1) then eng.move(2,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,11,15,4 ,3,xPos,yPos,1) then eng.move(3,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,4 ,10,4 ,3,xPos,yPos,1) then eng.move(5,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,18,10,4 ,3,xPos,yPos,1) then eng.move(4,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(1,31,5 ,18,3,xPos,yPos,0) then --transit
blockmon()
bt(1)
bc(1)
btransit()
drawt(1)
while true do
while true do--clickloop 2
event, button, xPos, yPos = os.pullEvent("mouse_click")
if button==1 or button==2 or button==3 then break end
end
if     bcheck(1,31,5 ,18,3,xPos,yPos,0) then x=0 z=0 y=0 rwr(x,y,z,f,l) bdraw() bnames() bt(0) bc(0) bf(f) bl(l) drawt(0) drawmon()break--breaking on transit button
elseif bcheck(1,24,7 ,5 ,9,xPos,yPos,1) then rwr(x,y,z,f,l) sleep(0.5) shell.run("startup")--breaking on transit button
elseif bcheck(1,4 ,5 ,4 ,3,xPos,yPos,0) then if button==1 then x=x+1 elseif button==2 then x=x+10 else x=x+100 end
elseif bcheck(1,4 ,10,4 ,3,xPos,yPos,0) then x=0
elseif bcheck(1,4 ,15,4 ,3,xPos,yPos,0) then if button==1 then x=x-1 elseif button==2 then x=x-10 else x=x-100 end
elseif bcheck(1,11,5 ,4 ,3,xPos,yPos,0) then if button==1 then y=y+1 elseif button==2 then y=y+10 else y=y+100 end
elseif bcheck(1,11,10,4 ,3,xPos,yPos,0) then y=0
elseif bcheck(1,11,15,4 ,3,xPos,yPos,0) then if button==1 then y=y-1 elseif button==2 then y=y-10 else y=y-100 end
elseif bcheck(1,18,5 ,4 ,3,xPos,yPos,0) then if button==1 then z=z+1 elseif button==2 then z=z+10 else z=z+100 end
elseif bcheck(1,18,10,4 ,3,xPos,yPos,0) then z=0
elseif bcheck(1,18,15,4 ,3,xPos,yPos,0) then if button==1 then z=z-1 elseif button==2 then z=z-10 else z=z-100 end
end
rwr(x,y,z,f,l)
drawt(2)
tdark()
if x<0 then term.setCursorPos(34,12) elseif x==0 then term.setCursorPos(35,12) else term.setCursorPos(34,12) term.write("+") end term.write(tostring(x))
if y<0 then term.setCursorPos(34,14) elseif y==0 then term.setCursorPos(35,14) else term.setCursorPos(34,14) term.write("+") end term.write(tostring(y))
if z<0 then term.setCursorPos(34,16) elseif z==0 then term.setCursorPos(35,16) else term.setCursorPos(34,16) term.write("+") end term.write(tostring(z))
end
end
else--event is a touch
if     bcheck(0,1,1,1,1,xPos,yPos,1) then eng.move(1,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(0,3,1,1,1,xPos,yPos,1) then eng.move(2,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(0,5,1,1,1,xPos,yPos,0) then if l==0 then l=1 else l=0 end rs.setBundledOutput(side,ff*f+lux*l) rwr(x,y,z,f,l) bl(l) drawmon()--lux
elseif bcheck(0,2,2,1,1,xPos,yPos,1) then eng.move(4,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(0,4,2,1,1,xPos,yPos,1) then eng.move(5,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(0,1,3,1,1,xPos,yPos,0) then if f==0 then f=1 else f=0 end rs.setBundledOutput(side,ff*f+lux*l) rwr(x,y,z,f,l) bf(f) drawmon()--FF
elseif bcheck(0,3,3,1,1,xPos,yPos,1) then eng.move(3,false,false) sleep(delay1) shell.run("startup")
elseif bcheck(0,5,3,1,1,xPos,yPos,1) then eng.move(0,false,false) sleep(delay1) shell.run("startup")
end
end
end
else--transiting mode
bt(2)
drawt(2)
tdark()
parallel.waitForAny(click,wait)
if x<0 then term.setCursorPos(34,12) elseif x==0 then term.setCursorPos(35,12) else term.setCursorPos(34,12) term.write("+") end term.write(tostring(x)) 
if y<0 then term.setCursorPos(34,14) elseif y==0 then term.setCursorPos(35,14) else term.setCursorPos(34,14) term.write("+") end term.write(tostring(y)) 
if z<0 then term.setCursorPos(34,16) elseif z==0 then term.setCursorPos(35,16) else term.setCursorPos(34,16) term.write("+") end term.write(tostring(z)) 
if y>0 then y=y-1 rwr(x,y,z,f,l) eng.move(1,false,false) elseif y<0 then y=y+1 rwr(x,y,z,f,l) eng.move(0,false,false) end
if x>0 then x=x-1 rwr(x,y,z,f,l) eng.move(2,false,false) elseif x<0 then x=x+1 rwr(x,y,z,f,l) eng.move(3,false,false) end
if z>0 then z=z-1 rwr(x,y,z,f,l) eng.move(5,false,false) elseif z<0 then z=z+1 rwr(x,y,z,f,l) eng.move(4,false,false) end
end