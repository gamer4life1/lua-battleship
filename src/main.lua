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
    --print("Entering inTable func")
    for key, value in pairs(tbl) do
    --     print(value)
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
        if (i < 10) then io.write(" ") end
        for j=1,10 do io.write(grid[i][j]) end
        print("\n")
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
    PlaceShip(tonumber(Row), tonumber(Column), Direction, 5, grid, "A")
    ShowGrid(grid)

    -- Battleship
    print("Ok, next is the battleship. It occupies 4 spaces.")
    print("Please select a row between 1 and 10.")
    Row = io.read()
    print("Please select a column between 1 and 10.")
    Column = io.read()
    print("Please select a direction.")
    Direction = io.read()

    while InputAndPosCheck(Row, Column, Direction, 4, grid) == false do
        print("Invalid input!")
        print("Please select a row between 1 and 10.")
        Row = io.read()
        print("Please select a column between 1 and 10.")
        Column = io.read()
        print("Please select a direction.")
        Direction = io.read()
    end
    PlaceShip(tonumber(Row), tonumber(Column), Direction, 4, grid, "B")
    ShowGrid(grid)

    -- Cruiser
    print("Ok. Next is the cruiser. It occupies 3 spaces")
    print("Please select a row between 1 and 10.")
    Row = io.read()
    print("Please select a column between 1 and 10.")
    Column = io.read()
    print("Please select a direction.")
    Direction = io.read()

    while InputAndPosCheck(Row, Column, Direction, 3, grid) == false do
        print("Invalid input!")
        print("Please select a row between 1 and 10.")
        Row = io.read()
        print("Please select a column between 1 and 10.")
        Column = io.read()
        print("Please select a direction.")
        Direction = io.read()
    end
    PlaceShip(tonumber(Row), tonumber(Column), Direction, 3, grid, "R")
    ShowGrid(grid)

    -- Submarine
    print("All right, next is the submarine. It occupies 3 spaces.")
    print("Please select a row between 1 and 10.")
    Row = io.read()
    print("Please select a column between 1 and 10.")
    Column = io.read()
    print("Please select a direction.")
    Direction = io.read()

    while InputAndPosCheck(Row, Column, Direction, 3, grid) == false do
        print("Invalid input!")
        print("Please select a row between 1 and 10.")
        Row = io.read()
        print("Please select a column between 1 and 10.")
        Column = io.read()
        print("Please select a direction.")
        Direction = io.read()
    end
    PlaceShip(tonumber(Row), tonumber(Column), Direction, 3, grid, "S")
    ShowGrid(grid)

    -- Destroyer
    print("Finally, let's do the destroyer. It occupies 2 spaces.")
    print("Please select a row between 1 and 10.")
    Row = io.read()
    print("Please select a column between 1 and 10.")
    Column = io.read()
    print("Please select a direction.")
    Direction = io.read()

    while InputAndPosCheck(Row, Column, Direction, 2, grid) == false do
        print("Invalid input!")
        print("Please select a row between 1 and 10.")
        Row = io.read()
        print("Please select a column between 1 and 10.")
        Column = io.read()
        print("Please select a direction.")
        Direction = io.read()
    end
    PlaceShip(tonumber(Row), tonumber(Column), Direction, 2, grid, "D")

end

function PlaceShip(row, column, direction, length, grid, symbol)
    for i=1, length do
        grid[row][column] = " " .. symbol .. " "
        if direction == "up" then
            row = row - 1
        elseif direction == "down" then
            row = row + 1
        elseif direction == "left" then
            column = column - 1
        elseif direction == "right" then
            column = column + 1
        end
    end
end

function InputAndPosCheck(row, column, direction, length, grid)
    Empty = true
    TempRow = tonumber(row)
    TempColumn = tonumber(column)

    if (TempRow == nil or TempColumn == nil or not InTable(Dirs, direction)) then
        Empty = false
        return Empty
    end

    for i=1, length do
        if TempRow > 10 or TempRow < 1 or TempColumn > 10 or TempColumn < 1 then
            Empty = false
            return Empty
        end

        if grid[TempRow][TempColumn] ~= " - " then
            Empty = false
            return Empty
        end

        if direction == "up" then
            TempRow = TempRow - 1
        elseif direction == "down" then
            --print("It\'s going down")
            TempRow = TempRow + 1
        elseif direction == "left" then
            TempColumn = TempColumn - 1
        elseif direction == "right" then
            TempColumn = TempColumn + 1
        else
            Empty = false
            return Empty
        end

    end
    return Empty
end


function EnemyShips(eG)
    Row = 0
    Column = 0
    Direction = ""
    -- Carrier
    repeat
        Row = math.random(10)
        Column = math.random(10)
        DirectionN = math.random(4)

        if DirectionN == 1 then
            Direction = "left"
            --print("Left")
        elseif DirectionN == 2 then
            Direction = "up"
            --print("Up")
        elseif DirectionN == 3 then
            Direction = "right"
            --print("Right")
        elseif DirectionN == 4 then
            Direction = "down"
            --print("Down")
        end
    until(InputAndPosCheck(Row, Column, Direction, 5, eG) == true)
    PlaceShip(Row, Column, Direction, 5, eG, "A")

    -- Battleship
    repeat
        Row = math.random(10)
        Column = math.random(10)
        DirectionN = math.random(4)

        if DirectionN == 1 then
            Direction = "left"
            --print("Left")
        elseif DirectionN == 2 then
            Direction = "up"
            --print("Up")
        elseif DirectionN == 3 then
            Direction = "right"
            --print("Right")
        elseif DirectionN == 4 then
            Direction = "down"
            --print("Down")
        end
    until(InputAndPosCheck(Row, Column, Direction, 4, eG) == true)
    PlaceShip(Row, Column, Direction, 4, eG, "B")

    -- Cruiser
    repeat
        Row = math.random(10)
        Column = math.random(10)
        DirectionN = math.random(4)

        if DirectionN == 1 then
            Direction = "left"
            --print("Left")
        elseif DirectionN == 2 then
            Direction = "up"
            --print("Up")
        elseif DirectionN == 3 then
            Direction = "right"
            --print("Right")
        elseif DirectionN == 4 then
            Direction = "down"
            --print("Down")
        end
    until(InputAndPosCheck(Row, Column, Direction, 3, eG) == true)
    PlaceShip(Row, Column, Direction, 3, eG, "R")

    -- Submarine
    repeat
        Row = math.random(10)
        Column = math.random(10)
        DirectionN = math.random(4)

        if DirectionN == 1 then
            Direction = "left"
            --print("Left")
        elseif DirectionN == 2 then
            Direction = "up"
            --print("Up")
        elseif DirectionN == 3 then
            Direction = "right"
            --print("Right")
        elseif DirectionN == 4 then
            Direction = "down"
            --print("Down")
        end
    until(InputAndPosCheck(Row, Column, Direction, 3, eG) == true)
    PlaceShip(Row, Column, Direction, 3, eG, "S")

    -- Destroyer
    repeat
        Row = math.random(10)
        Column = math.random(10)
        DirectionN = math.random(4)

        if DirectionN == 1 then
            Direction = "left"
            --print("Left")
        elseif DirectionN == 2 then
            Direction = "up"
            --print("Up")
        elseif DirectionN == 3 then
            Direction = "right"
            --print("Right")
        elseif DirectionN == 4 then
            Direction = "down"
            --print("Down")
        end
    until(InputAndPosCheck(Row, Column, Direction, 2, eG) == true)
    PlaceShip(Row, Column, Direction, 2, eG, "D")
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


function IsAlive(grid)

    x = 0
    y = 0

    for x=1, 10 do
        for y=1, 10 do
            if grid[x][y] == " X " then
                x = x + 1
            end
        end
    end
    print(x)
    if x >= 17 then
        return false
    end

    return true

end

function PlayerTurn(CGrid, Hitlist)

    repeat
        print("What is the row to fire at?")
        XCoord = tonumber(io.read())
        print("What is the column to fire at?")
        YCoord = tonumber(io.read())
    until(XCoord ~= nil and YCoord ~= nil and 1 <= XCoord and XCoord <= 10 and 1 <= YCoord and YCoord <= 10 and CGrid[XCoord][YCoord] ~= " O " and CGrid[XCoord][YCoord] ~= " X ")

    if CGrid[XCoord][YCoord] ~= " - " and CGrid[XCoord][YCoord] ~= " O " then
        Hitlist[XCoord][YCoord] = " X "
        CGrid[XCoord][YCoord] = " X "
        print("You shot the computer\'s ship at " .. XCoord .. ", " .. YCoord .. "!")
    else
        Hitlist[XCoord][YCoord] = " O "
        CGrid[XCoord][YCoord] = " O "
    end
end

function EnemyTurn(PGrid)
    repeat
    XCoord = math.random(1, 10)
    YCoord = math.random(1, 10)
    until(PGrid[XCoord][YCoord] ~= " O " and PGrid[XCoord][YCoord] ~= " X ")
    if PGrid[XCoord][YCoord] ~= " - " and PGrid[XCoord][YCoord] ~= " O " then
        PGrid[XCoord][YCoord] = " X "
        print("Your ship was shot at " .. XCoord .. ", " .. YCoord .. "!")
    else
        PGrid[XCoord][YCoord] = " O "
    end
end

-- Choose boat locations

print("Choose your boat locations.")
print("___________________________\n")

function Init()
    AskForShips(PGrid)
    EnemyShips(CGrid)
end


function MainLoop(PFirst)
    if PFirst then
        print("\nThis is your grid...")
        ShowGrid(PGrid)
        Wait(5)
        print("Here is the hitlist:")
        ShowGrid(Hitlist)
        PlayerTurn(CGrid, Hitlist)
        if IsAlive(CGrid) then
            EnemyTurn(PGrid)
        end
    else
        EnemyTurn(PGrid)

        if IsAlive(PGrid) then
            print("\nThis is your grid...")
            ShowGrid(PGrid)
            Wait(5)
            print("Here is the hitlist:")
            ShowGrid(Hitlist)
            PlayerTurn(CGrid, Hitlist)
        end
    end
end


Init()



while IsAlive(PGrid) and IsAlive(CGrid) do
    MainLoop(PFirst)
end

if IsAlive(PGrid) then
    print("You won! Congratulations...")
else
    print("You lost... Better luck next time!")
end
