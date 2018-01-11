local mod = math.fmod
local floor = math.floor
local abs = math.abs

local B =  4000000

function clear()
os.execute("clear")
end

-- Found here: https://stackoverflow.com/a/18725427
function srandom( seedobj, fVal1, fVal2 )
   local ma = seedobj.ma
   local seed = seedobj.seed
   local mj, mk
   if seed < 0 or not ma then
      ma = {}
      seedobj.ma = ma
      mj = abs( 1618033 - abs( seed ) )
      mj = mod( mj, B )
      ma[55] = mj
      mk = 1
      for i = 1, 54 do
         local ii = mod( 21 * i,  55 )
         ma[ii] = mk
         mk = mj - mk
         if mk < 0 then mk = mk + B end
         mj = ma[ii]
      end
      for k = 1, 4 do
         for i = 1, 55 do
            ma[i] = ma[i] - ma[ 1 + mod( i + 30,  55) ]
            if ma[i] < 0 then ma[i] = ma[i] + B end
         end
      end
      seedobj.inext = 0
      seedobj.inextp = 31
      seedobj.seed = 1
   end -- if
   local inext = seedobj.inext
   local inextp = seedobj.inextp
   inext = inext + 1
   if inext == 56 then inext = 1 end
   seedobj.inext = inext
   inextp = inextp + 1
   if inextp == 56 then inextp = 1 end
   seedobj.inextp = inextp
   mj = ma[ inext ] - ma[ inextp ]
   if mj < 0 then mj = mj + B end
   ma[ inext ] = mj
   local temp_rand = mj / B
   if fVal2 then
      return floor( fVal1 + 0.5 + temp_rand * ( fVal2 - fVal1 ) )
   elseif fVal1 then
      return floor( temp_rand * fVal1 ) + 1
   else
      return temp_rand
   end
end
seedobj = {
   seed = -232343
}
for i = 1, 4 do
   srandom( seedobj, 100, 1000 )
end
print("Are you doing pass and play? (Type \"y\" or Press Enter)")
jobber = true
pass = io.read()
if pass == "y" then
   pass = "yes"
   print("Type the code:")
   sed = io.read()
   if sed == "" then
      seedobj.seed = os.clock() * -1000000
      print(seedobj.seed * -1)
   else
      seedobj.seed = tonumber(sed) *-1
   end
   --math.randomseed(os.clock())
else
   print("Type the code:")
   sed = io.read()
   pass = "no"
   if sed == "" then
      seedobj.seed = os.clock() * -1000000
      print(seedobj.seed * -1)
   else
      seedobj.seed = tonumber(sed) *-1
   end
end
loc = {-- add playlists/mappacks
   [1] = {
      [1]="Train",
      [2]="Engineer",
      [3]="Mechanic",
      [4]="Guard",
      [5]="Engine Worker",
      [6]="Passenger",
   },
   [2]  = {
      [1]="Resort",
      [2]="Manager",
      [3]="Life Guard",
      [4]="Assistant",
      [5]="Bartender",
      [6]="Vacationer",
   },
   [3]  = {
      [1]="Homeless Shelter",
      [2]="Assistant",
      [3]="Manager",
      [4]="Volunteer",
      [5]="Volunteer",
      [6]="Homeless Person",
   },
   [4]  = {
      [1]="Police Station",
      [2]="Forensics",
      [3]="Sheriff",
      [4]="Police Man",
      [5]="Police Man",
      [6]="Criminal",
   },
   [5]  = {
      [1]="Movie Theatre",
      [2]="Janitor",
      [3]="Janitor",
      [4]="Cashier",
      [5]="Guard",
      [6]="Movie-Goer",
   },
   [6]  = {
      [1]="Space Station",
      [2]="Captain Kirk",
      [3]="Astrophysicist",
      [4]="Alien Imposter",
      [5]="Doctor",
      [6]="Astronomer",
   },
   [7] = {
      [1]="Hotel",
      [2]="Cashier",
      [3]="Bellhop",
      [4]="Maid",
      [5]="Cook",
      [6]="Customer",
   },
   [8] = {
      [1]="Office",
      [2]="Manager",
      [3]="Assisant",
      [4]="Receptionist",
      [5]="Business-Owner",
      [6]="Worker",
   },
   [9]  = {
      [1]="Restaurant",
      [2]="Cook",
      [3]="Cashier",
      [4]="Janitor",
      [5]="Manager",
      [6]="Customer",
   },
   [10]  = {
      [1]="School",
      [2]="Teacher",
      [3]="Principal",
      [4]="Janitor",
      [5]="Officer",
      [6]="Student",
   },
   [11]  = {
      [1]="Passenger Plane",
      [2]="Pilot",
      [3]="Flight Attendant",
      [4]="Terrorist",
      [5]="Co-Pilot",
      [6]="Passenger",
   },
   [12]  = {
      [1]="Bank",
      [2]="Teller",
      [3]="Teller",
      [4]="Gaurd",
      [5]="Manager",
      [6]="Customer",
   },
   [13] = {
      [1]="Church",
      [2]="Priest",
      [3]="Chorister",
      [4]="Missionary",
      [5]="Pianist",
      [6]="Faithful Person",
   },
   [14]  = {
      [1]="Hospital",
      [2]="Doctor",
      [3]="Guard",
      [4]="Nurse",
      [5]="Student",
      [6]="Patient",
   },
   [15] = {
      [1]="Miltary Base",
      [2]="Pilot",
      [3]="Tank Driver",
      [4]="Captain",
      [5]="General",
      [6]="Infantry",
   },
   [16]  = {
      [1]="Cruise Ship",
      [2]="Guard",
      [3]="Captain",
      [4]="Cook",
      [5]="Guest Speaker",
      [6]="Passenger",
   },
   [17]  = {
      [1]="Bomber Plane",
      [2]="Pilot",
      [3]="Coordinator",
      [4]="Co-Pilot",
      [5]="Weapons Manager",
      [6]="Mechanic",
   },
   [18] = {
      [1]="Oil Rig",
      [2]="Manager",
      [3]="Cook",
      [4]="Mechanic",
      [5]="Janitor",
      [6]="Worker",
   },
   [19]  = {
      [1]="The Mall",
      [2]="Officer",
      [3]="Manager",
      [4]="Store Owner",
      [5]="Cashier",
      [6]="Customer",
   },
   [20]  = {
      [1]="The White House",
      [2]="President",
      [3]="Alien Biologist",
      [4]="Gaurd",
      [5]="First Lady",
      [6]="Tourist",
   },
   [21]  = {
      [1]="Gas Station",
      [2]="Cashier",
      [3]="Janitor",
      [4]="Manager",
      [5]="Janitor",
      [6]="Customer",
   },
   [22]  = {
      [1]="Pub",
      [2]="Bar Tender",
      [3]="Janitor",
      [4]="Manager",
      [5]="Underaged Drinker",
      [6]="Customer",
   },
   [23]  = {
      [1]="Zoo",
      [2]="Zoo Keeper",
      [3]="Zoo Keeper",
      [4]="Cashier",
      [5]="Tour Guide",
      [6]="Tourist",
   },
   [24]  = {
      [1]="Lake",
      [2]="Boater",
      [3]="Fisher",
      [4]="Canoer",
      [5]="Kayaker",
      [6]="Swimmer",
   },
   [25]  = {
      [1]="Laboratory",
      [2]="Lab Assistant",
      [3]="Lab Worker",
      [4]="Janitor",
      [5]="Alien Species",
      [6]="Researcher",
   },
   [26]  = {
      [1]="The Moon",
      [2]="Alien Hunter",
      [3]="Xenobiologist",
      [4]="Xenoarchiologist",
      [5]="Geologist",
      [6]="Astronaut",
   },
   [27]  = {
      [1]="Prison",
      [2]="Serial Killer",
      [3]="Burglar",
      [4]="Guard",
      [5]="Drug Dealer",
      [6]="Criminal",
   },
   [28]  = {
      [1]="Area 51",
      [2]="Xenotechnologist",
      [3]="Researcher",
      [4]="UFO",
      [5]="Guard",
      [6]="Alien",
   },
   [29]  = {
      [1]="Construction Site",
      [2]="Foreman",
      [3]="Crane Operator",
      [4]="Trucker",
      [5]="Forklift Operator",
      [6]="Construction Worker",
   },
   [30]  = {
      [1]="Road Trip",
      [2]="Driver",
      [3]="Shotgun",
      [4]="Backseat Driver",
      [5]="Very Back Seat",
      [6]="Middle Seat",
   },
   [31]  = {
      [1]="Park",
      [2]="Parent",
      [3]="Parent",
      [4]="Stalker",
      [5]="Officer",
      [6]="Child",
   },
   [32]  = {
      [1]="Fire Station",
      [2]="Manager",
      [3]="Receptionist",
      [4]="Driver",
      [5]="Instructor",
      [6]="Fire Fighter",
   },
   [33]  = {
      [1]="Day Care",
      [2]="Concerned Parent",
      [3]="Care Taker",
      [4]="Owner",
      [5]="Bully",
      [6]="Child",
   },
   [34]  = {
      [1]="Store",
      [2]="Clerk",
      [3]="Janitor",
      [4]="Grocer",
      [5]="Greeter",
      [6]="Customer",
   },
   [35]  = {
      [1]="Back Alley",
      [2]="Gangsta",
      [3]="Fancy Lady",
      [4]="Thug",
      [5]="Dealer",
      [6]="Innocent Person",
   },
   [36]  = {
      [1]="Castle",
      [2]="Servant",
      [3]="Knight",
      [4]="King",
      [5]="Queen",
      [6]="Peasant",
   },
   [37]  = {
      [1]="Factory",
      [2]="Machinist",
      [3]="Electrician",
      [4]="Machine Operator",
      [5]="Manager",
      [6]="Worker",
   },
   [38]  = {
      [1]="House",
      [2]="Mother",
      [3]="Father",
      [4]="Dog",
      [5]="Squatter",
      [6]="Child",
   },
   [39]  = {
      [1]="Heaven",
      [2]="A God",
      [3]="Angel",
      [4]="Janitor",
      [5]="Angel",
      [6]="Soul",
   },
   [40]  = {
      [1]="Hell",
      [2]="Devil",
      [3]="Reaper",
      [4]="Reaper",
      [5]="Janitor",
      [6]="Soul",
   },
   [41]  = {
      [1]="Strip Club",
      [2]="Bouncer",
      [3]="Stripper",
      [4]="Stripper",
      [5]="Lonely Rich Guy",
      [6]="Customer",
   },
   [42]  = {
      [1]="Crime Scene",
      [2]="Investigator",
      [3]="Officer",
      [4]="Officer",
      [5]="Victim",
      [6]="Citizen",
   },
   [43]  = {
      [1] = "Exploration Outpost",
      [2]="Scientist",
      [3]="Survivalist",
      [4]="Guide",
      [5]="Mission Specialist",
      [6]="Explorer",
   },
   [44]  = {
      [1] = "Barber Shop",
      [2]="Stylist",
      [3]="Hair Cutter",
      [4]="Hair Cutter",
      [5]="Janitor",
      [6]="Customer",
   },
   [45]  = {
      [1] = "Campsite",
      [2]="Guide",
      [3]="Cook",
      [4]="Pack Mule",
      [5]="Pack Mule",
      [6]="Camper",
   },
   [46]  = {
      [1] = "Gun Range",
      [2]="Munitions Expert",
      [3]="Gaurd",
      [4]="Spectator",
      [5]="Overseer",
      [6]="Customer",
   },
}
choices = {}
max = #loc
print("Enter the difficulty (1 - "..max.."):")
list = io.read()
if list == "" then
   list = 15
   print(list)
elseif tonumber(list) > max then
   list = max
   print(list)
else
   list = tonumber(list)
end
list1 = list
repeat
   list1 = list1 - 1
   srandom(seedobj, 1, list1)
until list1 == 0 -- have to enter same difficulty for same game
print("How many players?")
nump = io.read()
nump = tonumber(nump)
spy = srandom(seedobj,1, nump)
play =  srandom(seedobj,1, nump)
password = {}
locc =  srandom(seedobj,1, max)
location = loc[locc][1]
it = srandom(seedobj,1,list)
choices[it] = loc[locc][1]
if pass == "yes" then
   mynum = 1
else
   print("What's your number?")
   mynum = io.read()
end
print("")

job = {}
function stats()
   num1 = 1
   repeat
      choice = srandom(seedobj, 1, max)
      good = true
      slot = 0
      num = 1
      repeat
         if choices[num] == nil then
            slot = num
         end
         if choices[num] == loc[choice][1] then
            good = false
         end
         num = num + 1
      until num > list
      if good and slot ~= 0 then
         choices[slot] = loc[choice][1]
         num1 = num1 + 1
      end
   until num1 == list
end
stats()
function jobs()
   if pass == "yes" then
      mynum2 = mynum
      no = false
      repeat
         myjob =  srandom(seedobj,1, nump-1)
         job[mynum2] = myjob
         num1 = 1
         repeat
            if myjob == job[num1] and num1 ~= mynum2
            then
               no = true
               break
            end
            num1 = num1 + 1
         until num1 > tonumber(mynum)
         if no == false then
            break
         else
            no = false
         end
      until 1 + 1 == 3
   else
      mynum3 = mynum
      mynum = 1
      repeat
         mynum2 = mynum
         no = false
         repeat
            if tonumber(mynum2) == spy then
               break
            end
            myjob =  srandom(seedobj,1, nump-1)
            job[mynum2] = myjob
            num1 = 1
            repeat
               if myjob == job[num1] and num1 ~= mynum2
               then
                  no = true
                  break
               end
               num1 = num1 + 1
            until num1 > tonumber(mynum)
            if no == false then
               break
            else
               no = false
            end
         until 1 + 1 == 3
         mynum = mynum + 1
      until mynum > nump
      mynum = mynum3
      myjob = job[tonumber(mynum)]
   end
end
check = srandom(seedobj,1, 1000)
function who()
   if tonumber(mynum) == spy then
      print("You are the spy!")
      print("Check: "..check)
   else
      print("You are NOT the spy!")
      print(location)
      if password[mynum] == nil then
         jobs()
      end
      if myjob < 6 then
         print(loc[locc][myjob +1])
      else
         print(loc[locc][6])
      end
   end
   if pass == "yes" then
      if password[mynum] == nil then
         print("Enter password?")

         pas = io.read()
         if pas ~= "" then
            password[mynum] = pas
         else
            password[mynum] = tostring(mynum)
            print(mynum)
         end
      end
   end
   print("Press enter")
   io.read()
end
function lister2()
   print("Player "..play.." goes first. \n")
   print("Places: \n")
   num = 1
   repeat
      print(choices[num])
      num = num+ 1
   until num > list
end

function lister()
   print("Player "..play.." goes first. \n")
   print("Places: \n")
   num = 1
   cat1 = 18
   repeat
      cat = cat1 - string.len(choices[num])
      if cat < 1 then
         cat = 1
      end
      if string.len(choices[num]..string.rep(" ", cat)..choices[num + (math.floor(list/2))]) < 33 then
         print(choices[num]..string.rep(" ", cat)..choices[num + (math.floor(list/2))])
      else
         ohalf = choices[num + (math.floor(list/2))]
         print(choices[num]..string.rep(" ", cat)..string.sub(ohalf, 1, math.floor(string.len(ohalf) /2)).."-\n"..string.rep(" ", cat1 + 1)..string.sub(ohalf, math.floor((string.len(ohalf) /2)+ 1),string.len(ohalf)))
      end
      num = num+ 1
   until num > math.floor(list/2)
   if list % 2 ~= 0 then
      print(choices[list])
   end
end
if pass == "yes" then
   print("Player 1 press enter")
   io.read()
   repeat
      who()
      mynum = mynum + 1
      clear()
      if mynum > nump then
         break
      end
      print("player "..mynum.." press enter.")
      io.read()
   until mynum > nump
else
   who()
end
cow = 15
repeat
   cow = cow - 1
   print("")
until cow == 0
lister()
repeat
   print("----------")
   code = io.read()
   mynum2 = 0
   repeat
      if code == password[mynum2] then
         myjob = job[mynum2]
         mynum = mynum2
         who()
         clear()
         lister()
         break
      end
      mynum2 = mynum2 + 1
   until mynum2 > nump
   if tonumber(code) == check then
      print("Spy is: "..spy)
   end
   if code == "list" then
      clear()
      if pass ~= "yes" then
         who()
         cow = 15
         repeat
            cow = cow - 1
            print("")
         until cow == 0
      end
      lister2()
   end
   if code == "block" then
      clear()
      if pass ~= "yes" then
         who()
         cow = 15
         repeat
            cow = cow - 1
            print("")
         until cow == 0
      end
      lister()
   end
until 1 + 1 == 3