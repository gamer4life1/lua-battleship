--require("strict")
function Input(message)
  print(message)
  return io.read()
end




--function inputn(message)
--  io.write(message)
--  return io.read()
--end

function Ninput(message)
  print(message)
  local var
  var = io.read("*n")
  io.read()
  return var
end




function InTable(tbl, item)
    print("Entering inTable func")
    for key, value in pairs(tbl) do
        print(value)
        if value == item then return key end
    end
    return false
end

function Wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
end

function InitGrid()
    local empty = {}
    for i=1,10 do
        empty[i] = {}
        for j=1,10 do
            empty[i][j] = " - "
        end
    end
    return empty
end

function ShowGrid(grid)
    print("   1  2  3  4  5  6  7  8  9  10")
    for i=1,10 do
        io.write(i)
        -- Check if still need to print more nums
        if (i < 10) then io.write("  ") end
        for j=1,10 do io.write(grid[i][j]) end
    end
end

function AskForShips(grid)

    -- Carrier
    print("Let's start with the carrier. It occupies 5 spaces.")
    print("Please select a row between 1 and 10.")
    Row = io.read()
    print("Please select a column between 1 and 10.")
    Column = io.read()
    print("Please select a direction.")
    Direction = io.read()

    while InputAndPosCheck(Row, Column, Direction, 5, grid) == false do
        print("Invalid input!")
        print("Please select a row between 1 and 10.")
        Row = io.read()
        print("Please select a column between 1 and 10.")
        Column = io.read()
        print("Please select a direction.")
        Direction = io.read()
    end
    PlaceShip(tonumber(Row), tonumber(Column), tonumber(Direction), 5, grid)
    ShowGrid(grid)

end

function InputAndPosCheck(row, column, direction, length, grid)
    
end



-- Set initial vars
math.randomseed(os.time())
TABLE_LH = 10
-- BoatNames = {"carrier", "battleship", "destroyer", "sub", "patrol"}
Dirs = {"left", "right", "up", "down"}
--pBoatLengths = {}
--cBoatLengths = {}
PGrid = InitGrid()
CGrid = InitGrid()
Hitlist = InitGrid()




print("Battleship!")
print("Choosing who goes first...")
First = math.floor(math.random(1,6))
--print(first)
Wait(5)
if First <= 3 then
    PFirst = true
    print("You go first!")
else
    PFirst = false
    print("Computer goes first!")
end



-- Choose boat locations

print("Choose your boat locations.")
print("___________________________\n")

function MainLoop()
  Printline = ""
  print("\nYour board:\nKey:\n-: nothing\n~: destroyed\n*: boat\n")
  for i=1, 10 do
    for j=1, 10 do
      Printline = Printline .. PGrid[i][j]
    end
    print(Printline)
    Printline = ""
  end
end


MainLoop()

