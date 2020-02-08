--require("strict")
function input(message)
  print(message)
  return io.read()
end




--function inputn(message)
--  io.write(message)
--  return io.read()
--end

function ninput(message)
  print(message)
  local var
  var = io.read("*n")
  io.read()
  return var
end




function inTable(tbl, item)
    print("Entering inTable func")
    for key, value in pairs(tbl) do
        print(value)
        if value == item then return key end
    end
    return false
end

function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
end

function verifyCoords(dir, yCoord, xCoord, TABLE_LH, dirs, y, x, boatNames)
  if dir == "left" then
    while pBoard[yCoord][xCoord - y] ~= " ~ " do
      while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
        xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
        yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
        dir = input("Should the boat go up, down, left or right?")
        if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
          print("Invalid input. Please try again...\n")
        end
      end
    end
  elseif dir == "right" then
    while pBoard[yCoord][xCoord + y] ~= " ~ " do
      while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
        xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
        yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
        dir = input("Should the boat go up, down, left or right?")
        if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
          print("Invalid input. Please try again...\n")
        end
      end
    end
  elseif dir == "up" then
    while pBoard[yCoord - y][xCoord] ~= " ~ " do
      while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
        xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
        yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
        dir = input("Should the boat go up, down, left or right?")
        if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
          print("Invalid input. Please try again...\n")
        end
      end
    end
  elseif dir == "down" then
    print("test")
    while pBoard[yCoord + y][xCoord] ~= " ~ " do
      while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
        xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
        yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
        dir = input("Should the boat go up, down, left or right?")
        if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
          print("Invalid input. Please try again...\n")
        end
      end
    end
  end
end


-- Set initial vars
math.randomseed(os.time())
printline = ""
TABLE_LH = 10
pBoard = {}
cBoard = {}
first = 0
pFirst = false
boatNames = {"carrier", "battleship", "destroyer", "sub", "patrol"}
dirs = {"left", "right", "up", "down"}
boatLengths = {5, 4, 3, 3, 2}
--pBoatLengths = {}
--cBoatLengths = {}
hitlist = {}
xCoord = 0
yCoord = 0
dir = ""



local i = 1
local j = 1
for i=1,TABLE_LH do
    pBoard[i] = {}
    cBoard[i] = {}
    hitlist[i] = {}
    for j=1,TABLE_LH do
      pBoard[i][j] = " ~ "
      cBoard[i][j] = " ~ "
      hitlist[i][j] = " ~ "
    end
end

print("Battleship!")
print("Choosing who goes first...")
first = math.floor(math.random(1,6))
--print(first)
wait(5)
if first <= 3 then
    pFirst = true
    print("You go first!")
else
    pFirst = false
    print("Computer goes first!")
end



-- Choose boat locations

print("Choose your boat locations.")
print("___________________________\n")
for x=1,5 do
  while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
    xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
    yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
    dir = input("Should the boat go up, down, left or right?")
    if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
      print("Invalid input. Please try again...\n")
    end
  end
  printline = ""
  print("Your board:\nKey:\n~: nothing\n-: destroyed\n*: boat\n")
  
  pBoard[xCoord][yCoord] = " * "
  if string.lower(dir) == "left" then
      --print("Left")
      for y=1, boatLengths[x] do
        while not pcall(verifyCoords, dir, yCoord, xCoord, TABLE_LH, dirs, y, x, boatNames) do
            print("Invalid input!")
            xCoord = 0
            while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
                xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
                yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
                dir = input("Should the boat go up, down, left or right?")
                if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
                    print("Invalid input. Please try again...\n")
                end
            end
        end
        pBoard[yCoord][xCoord - y] = " * "
        xCoord = 0
        yCoord = 0
        dir = ""

      end
    elseif string.lower(dir) == "right" then
      --print("Right")
      for y=1, boatLengths[x] do
        while not pcall(verifyCoords, dir, yCoord, xCoord, TABLE_LH, dirs, y, x, boatNames) do
            print("Invalid input!")
            xCoord = 0
            while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
                xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
                yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
                dir = input("Should the boat go up, down, left or right?")
                if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
                    print("Invalid input. Please try again...\n")
                end
            end
        end
        pBoard[yCoord][xCoord + y] = " * "
        xCoord = 0
        yCoord = 0
        dir = ""
      end
    elseif string.lower(dir) == "up" then
      print("Up")
      for y=1, boatLengths[x] do
        while not pcall(verifyCoords, dir, yCoord, xCoord, TABLE_LH, dirs, y, x, boatNames) do
            print("Invalid input!")
            xCoord = 0
            while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
                xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
                yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
                dir = input("Should the boat go up, down, left or right?")
                if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
                    print("Invalid input. Please try again...\n")
                end
            end
        end
        pBoard[yCoord - y][xCoord] = " * "
        xCoord = 0
        yCoord = 0
        dir = ""
      end
    elseif string.lower(dir) == "down" then
      print("Down")
      for y=1, boatLengths[x] do
        while not pcall(verifyCoords, dir, yCoord, xCoord, TABLE_LH, dirs, y, x, boatNames) do
            print("Invalid input!")
            xCoord = 0
            while xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) do
                xCoord = ninput("Enter the start x coordinate for the " .. boatNames[x] .. ":")
                yCoord = ninput("Enter the start y coordinate for the " .. boatNames[x].. ":")
                dir = input("Should the boat go up, down, left or right?")
                if xCoord > TABLE_LH or xCoord < 1 or yCoord > TABLE_LH or yCoord < 1 or not inTable(dirs, dir) then
                    print("Invalid input. Please try again...\n")
                end
            end
        end
        print("Line 222 reached")
        pBoard[yCoord + y][xCoord] = " * "
        xCoord = 0
        yCoord = 0
        dir = ""
      end
    end
    for i=1, 10 do
      for j=1, 10 do
        printline = printline .. pBoard[i][j]
      end
      print(printline)
      printline = ""
    
    end
    xCoord = 0
    yCoord = 0
    dir = ""
  end



function mainLoop()
  printline = ""
  print("\nYour board:\nKey:\n-: nothing\n~: destroyed\n*: boat\n")
  for i=1, 10 do
    for j=1, 10 do
      printline = printline .. pBoard[i][j]
    end
    print(printline)
    printline = ""
  end
end


mainLoop()

