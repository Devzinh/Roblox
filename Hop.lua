-- Serviços necessários
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- Caminho para o arquivo temporário
local tempFilePath = "server-hop-temp.json"

-- Função para ler o arquivo temporário
local function readTempFile()
    local success, content = pcall(function()
        return HttpService:JSONDecode(readfile(tempFilePath))
    end)
    return success and content or {}
end

-- Função para escrever no arquivo temporário
local function writeTempFile(content)
    pcall(function()
        writefile(tempFilePath, HttpService:JSONEncode(content))
    end)
end

-- Função para obter servidores públicos disponíveis
local function getAvailableServers(placeId, cursor)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
    if cursor then
        url = url .. "&cursor=" .. cursor
    end
    local response = HttpService:JSONDecode(game:HttpGet(url))
    return response
end

-- Função para teletransportar o jogador para um servidor disponível
local function teleportToServer(placeId, visitedIds)
    local currentHour = os.date("!*t").hour
    local availableServers = getAvailableServers(placeId)
    local nextCursor = availableServers.nextPageCursor

    for _, serverInfo in ipairs(availableServers.data) do
        local serverId = tostring(serverInfo.id)
        if serverInfo.maxPlayers > serverInfo.playing then
            local alreadyVisited = false
            for _, id in ipairs(visitedIds) do
                if serverId == id then
                    alreadyVisited = true
                    break
                end
            end
            if not alreadyVisited then
                table.insert(visitedIds, serverId)
                writeTempFile(visitedIds)
                TeleportService:TeleportToPlaceInstance(placeId, serverId, game.Players.LocalPlayer)
                wait(4)
                break
            end
        end
    end

    -- Continua buscando servidores se houver mais páginas
    if nextCursor then
        teleportToServer(placeId, visitedIds)
    end
end

-- Módulo principal
local ServerHopModule = {}

function ServerHopModule:Teleport(placeId)
    local visitedIds = readTempFile()
    teleportToServer(placeId, visitedIds)
end

return ServerHopModule
