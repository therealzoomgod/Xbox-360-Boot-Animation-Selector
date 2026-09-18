scriptTitle = "Boot Animation Selector"
scriptAuthor = "therealzoomgod"
scriptVersion = 1
scriptDescription = "Selected animation copied to boot.wmv inside jukebox folder."
scriptIcon = "icon.png"
scriptPermissions = { "filesystem" }

local sourceFolder = "Hdd1:\\fakeanim\\wmv_files\\"
local query = sourceFolder .. "*.wmv"
local requiredName = "bootanim fall 2010.wmv"
local destination = "Hdd1:\\fakeanim\\jukebox\\boot.wmv"

local function message(kind, text)
    Script.ShowMessageBox(
        scriptTitle .. " - " .. kind,
        text,
        "OK"
    )
end

function main()
    local files = FileSystem.GetFiles(query)

    if type(files) ~= "table" then
        message("Error", "Unable to read:\n" .. sourceFolder)
        return
    end

    local requiredFound = false
    local choices = {}

    for _, file in pairs(files) do
        if type(file) == "table" and type(file.Name) == "string" then
            local name = file.Name
            local lowerName = name:lower()

            if lowerName == requiredName then
                requiredFound = true
            end

            if lowerName:match("%.wmv$") and lowerName ~= "boot.wmv" then
                choices[#choices + 1] = name
            end
        end
    end

    if not requiredFound then
        message(
            "Warning",
            "Required file not found:\n" .. requiredName ..
            "\n\nFolder:\n" .. sourceFolder
        )
        return
    end

    if #choices == 0 then
        message("Warning", "No selectable WMV files were found.")
        return
    end

    table.sort(choices, function(a, b)
        return a:lower() < b:lower()
    end)

    local selection = Script.ShowPopupList(
        "Select boot animation",
        "No WMV files available.",
        choices
    )

    if not selection or selection.Canceled then
        return
    end

    local selectedName = selection.Selected
        and choices[selection.Selected.Key]

    if not selectedName then
        message("Error", "No valid animation was selected.")
        return
    end

    local source = sourceFolder .. selectedName

    if not FileSystem.FileExists(source) then
        message("Error", "Selected file no longer exists:\n" .. source)
        return
    end

    if FileSystem.FileExists(destination) then
        if not FileSystem.DeleteFile(destination) then
            message("Error", "Could not delete:\n" .. destination)
            return
        end
    end

    if not FileSystem.CopyFile(source, destination, true) then
        message(
            "Error",
            "Could not copy:\n" .. selectedName ..
            "\n\nto:\n" .. destination ..
            "\n\nThe previous boot.wmv may have been deleted." ..
            "\nCheck that the jukebox folder exists and try again."
        )
        return
    end

    message(
        "Success",
        "Boot animation updated to:\n" .. selectedName
    )
end