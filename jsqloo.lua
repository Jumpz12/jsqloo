--[[
                Jumpz' SQLoo
                Put it in your addons please
                Made By Jumpz
]]

----------------------------------
-------- Config For Users --------
----------------------------------
require("mysqloo")
JSQLoo = JSQLoo or {}
JSQLoo.Config = JSQLoo.Config or {}

local config = JSQLoo.Config
----------------------------------

config.HOSTNAME = ""
config.USER = ""
config.PASSWORD = ""
config.DBNAME = ""
config.PORT = ""

----------------------------------
-------- Global Functions --------
-------- For addon makers --------
----------------------------------

JSQLoo.connect = function()

    jumpz_database = mysqloo.connect(config.HOSTNAME, config.USER, config.PASSWORD, config.DBNAME, config.PORT)
    jumpz_database.onConnected = function(db) print("Connected to Database: " .. config.DBNAME) end
    jumpz_database.onConnectionFailed = function(db, e) print("Could not connect to Database: " .. config.DBNAME .. "\n" .. e) end
    jumpz_database:connect()

end

JSQLoo.disconnect = function()
    jumpz_database:disconnect()
    print("Successfully disconnected from " .. config.DBNAME)
end

JSQLoo.createTable = function(tableName, fields) -- Use: https://www.w3schools.com/sql/sql_datatypes.asp for the datatypes

    local string = ""
    local counter = 1
    for _, info in ipairs(fields) do
        local comma = ""
        if counter ~= #fields then
            comma = ", "
        end
        string = string .. info.name .. " " .. string.upper(info.type) .. comma
        counter = counter + 1
    end
    local create_table = jumpz_database:query("CREATE TABLE IF NOT EXISTS " .. tableName .. " (" .. string .. ")"   )
    create_table.onSuccess = function() print("Table, " .. tableName .. " was created") end
    create_table.onError = function(q, e) print("An error happened creating table " .. tableName .. ": \n" .. e) end
    create_table:start()

end

--Example
--[[
    JSQLoo.createTable("spawnLocations", 
{
            {
                name = "team_id",
                type = "int"
            },

            {
                name = "team_name",
                type = "varchar"
            },
})
]]

