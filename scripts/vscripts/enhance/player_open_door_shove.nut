::PlayerOpenDoorShove <-
{
	enabled = true,

	function OnGameEvent_entity_shoved (event)
	{
		if (!enabled)
		{
			return;
		}

		local ent = EntIndexToHScript(event.entityid);

		if (ent == null)
		{
			return;
		}

		if (ent.GetClassname() != "prop_door_rotating" && ent.GetClassname() != "prop_door_rotating_checkpoint")
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.attacker);

		if (!pl.IsSurvivor())
		{
			return;
		}

		local button_mask = NetProps.GetPropInt(pl, "m_nButtons");

		local is_valid_button_mask = !(button_mask & ButtonMask.Back);

		if (!is_valid_button_mask)
		{
			return;
		}

		local pl_speed = ceil(pl.GetVelocity().Length());

		if (pl_speed <= 200)
		{
			return;
		}

		local is_locked = NetProps.GetPropInt(ent, "m_bLocked") == 1;

		if (is_locked)
		{
			return;
		}

		local door_state = NetProps.GetPropInt(ent, "m_eDoorState");

		local is_moving = door_state == 1;

		if (is_moving)
		{
			return;
		}

		local is_closed = door_state == 0;
		local is_ajar = door_state == 4;

		if (!is_closed && !is_ajar && !is_moving)
		{
			return;
		}

		local door_speed = NetProps.GetPropFloat(ent, "m_flSpeed");

		local new_door_speed = 950;

		local open_dir = NetProps.GetPropInt(ent, "m_eOpenDirection");

		local close_delay = NetProps.GetPropFloat(ent, "m_flAutoReturnDelay");

		if (close_delay != -1)
		{
			DoEntFire("!self", "AddOutput", "returndelay -1", 0.0, null, ent);
			DoEntFire("!self", "AddOutput", "returndelay " + close_delay.tostring(), 0.35, null, ent);

			local close_snip = "if (NetProps.GetPropInt(self, \"m_eDoorState\") != 0) DoEntFire(\"!self\", \"Close\", \"\", 0.0, null, self)";

			DoEntFire("!self", "RunScriptCode", close_snip, close_delay, null, ent);
		}

		if (is_moving)
		{
			DoEntFire("!self", "Close", "", 0.0, null, ent);
		}

		DoEntFire("!self", "SetSpeed", new_door_speed.tostring(), 0.0, null, ent);

		DoEntFire("!self", "OpenAwayFrom", "!activator", 0.0, pl, ent);

		DoEntFire("!self", "SetSpeed", door_speed.tostring(), 0.35, null, ent);
	},
}

__CollectEventCallbacks(PlayerOpenDoorShove, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerOpenDoorShove, "OnConsoleEvent_", "ConsoleEventCallbacks", null);
