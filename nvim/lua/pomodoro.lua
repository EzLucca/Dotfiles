_G.countdown_seconds = 0

function _G.countdown_status()
  if _G.countdown_seconds <= 0 then
    return ""  -- hide when finished
  end
  local min = math.floor(_G.countdown_seconds / 60)
  local sec = _G.countdown_seconds % 60
  return string.format("⏱ %02d:%02d", min, sec)
end

function _G.start_countdown_seconds(seconds)
  _G.countdown_seconds = seconds
  local function tick()
    if _G.countdown_seconds > 0 then
      _G.countdown_seconds = _G.countdown_seconds - 1
      vim.cmd("redrawstatus")  -- refresh statusline
      vim.defer_fn(tick, 1000)
    end
  end
  tick()  -- start ticking
end

-- function to tick every second
local function tick()
  if _G.countdown_seconds > 0 then
    _G.countdown_seconds = _G.countdown_seconds - 1
    vim.cmd("redrawstatus")  -- refresh statusline
    vim.defer_fn(tick, 1000) -- call tick again in 1 second
  end
end

-- start ticking
tick()

function _G.start_countdown_prompt()
  -- Ask user for time in minutes
  local input = vim.fn.input("Set countdown (minutes): ")
  local minutes = tonumber(input)

  if not minutes or minutes <= 0 then
    print("Invalid input")
    return
  end

  _G.countdown_seconds = minutes * 60
  tick()  -- start ticking
end
function _G.start_countdown(minutes)
  _G.countdown_seconds = minutes * 60
  tick()  -- start ticking immediately
end

vim.keymap.set("n", "<leader>pt", ":lua start_countdown_prompt()<CR>", { desc = 'timer' })
