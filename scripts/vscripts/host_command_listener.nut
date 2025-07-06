HostCommandListener <-
{
	function OnGameEvent_player_say (event)
	{
		if (GetPlayerFromUserID(event.userid) == GetListenServerHost())
		{
			local prompt = GetPrompt(event.text);

			if (prompt.len() >= 2 && prompt[0] == "@")
			{
				__RunEventCallbacks(prompt[1], prompt.slice(2), "OnCommandEvent_", "CommandEventCallbacks", false);
			}
		}
	}
}

__CollectEventCallbacks(HostCommandListener, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
