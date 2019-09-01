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
        jumpz_database.onConnected = function(db) print("Connected to Database: " .. db) end
        jumpz_database.onConnectionFailed = function(db, e) print("Could not connect to Database: " .. db .. "\n" .. e) end
        jumpz_database:connect()
        
end