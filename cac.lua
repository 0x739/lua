wait(15)
script_key = "CZOXicJLQawpzXwFvtocxKUiYAIeMQis";
getgenv().UserConfig = {
    FPS                 = 20,
    AddFriends          = true,

    RedeemCode = {"RELEASE", "THANKS", "LUCKY", "Easter", "Throwback", "update2"},

    ["Detector"] = {
        Enable = true,
        ["Name Needed"] = {"Avernus", "Patronus","Dementor"}, -- Blue
        ["Rarity Needed"] = {
            "Legendary", -- Green
            "Mythic", -- Red
            "Secret" -- Yellow
        }
    },

    ["Alien Shop"] = {
        Enable = true,
        ["Min Gems"] = "20m",
        ["Items Needed"] = {
            "Golden Key",
            "Mystery Box",
            "Lucky III",
            "Lucky IV"
        }
    },
    ["Black Market"] = {
        Enable = true,
        ["Min Gems"] = "1m",
        ["Items Needed"] = {
            "Lucky Evolved",
            "Mythic Evolved",
            "Speed Evolved"
        }
    },

    ["Craft Potions"] = {
        Enable = true,
        MinGems = 20000,
        ["Potion Needed"] = {
            {"Coins", Level = 5},
            {"Speed", Level = 5},
            {"Lucky", Level = 5},
            {"Mythic", Level = 5}
        }
    },

    ["Mastery"] = {
        Pets = 15,
        Buffs = 18,
        Shops = 10
    },

    Competitive = {
        Choosing = "1,2,1,2,1,1,2,2,1,2"
    },

    ["Star Shop"] = {
        Enable = true,
        MinStars = 300,
        ["Items Needed"] = {
            "Speed V",
            "Lucky V",
            "Mythic V"
        }
    },

    ["Rifts"] = {
        AlwaysFindRifts = true,
        Targets = {"Silly Egg", "Throwback Egg", "Nightmare Egg"},
        Luck = 5
    },
    ["Min gems"] = "5m", -- Farm min gems trước khi hatch FindDuck
    FindDuck = "100M Egg", -- Hatch 1x Egg
    ["Enchant Team 1"] = {enable = true, ["high-roller"] = 1}, 
    ["Gems coefficient"] = 24, -- Tìm pets >= tổng hệ số gems thì đi lên Zen farm Mastery và hatch Rainbow
    ["Replace 100M Egg"] = "Throwback Egg", -- Server không có 100M Egg thì chuyển qua đây hatch dự phòng
    ["Auto Restart"] = true,

    ["Webhook"] = {
        Enable = true, -- Enable/disable pet hatch notification webhook
        Note = "VPS1", -- Note displayed on the webhook
        ID = "1260849093127962634", -- ID Discord
        URL = "https://discord.com/api/webhooks/1367052717729517699/5H40bkilolz_Roxm-E53lqa5ps2SWon1UCjPOIkuTQcwvlZeMlAzyVDal1wpvAyiKr8U", -- Replace with your URL
        Rarity = {
            "Legendary",
            "Secret"
        }, -- General rarity filter
        Legendary = "100k", -- Threshold for Legendary (e.g., 100k = 1/100,000) - only send if chance >= threshold
        ["Special Pets"] = {"Avernus", "Patronus","Dementor"}
    }
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0cf205a620e81d1f3c3d3f75474ab32f.lua"))()
