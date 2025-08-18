::HostCommandListener <-
{
	function OnGameEvent_player_say (event)
	{
		local pl = GetPlayerFromUserID(event.userid);

		if (pl != GetListenServerHost())
		{
			return;
		}

		local prompt = GetPrompt(event.text);

		if (prompt.len() < 2 || prompt[0] != "!")
		{
			return;
		}

		__RunEventCallbacks(prompt[1], prompt.slice(2), "OnConsoleEvent_", "ConsoleEventCallbacks", false);
	},
}

__CollectEventCallbacks(HostCommandListener, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
