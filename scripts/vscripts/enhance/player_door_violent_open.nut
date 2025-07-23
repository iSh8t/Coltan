::PlayerDoorViolentOpen <-
{
	enabled = true,

	function OnGameEvent_entity_shoved (event)
	{
		if (enabled)
		{
			local shov = EntIndexToHScript(event.entityid);

			if (shov && (shov.GetClassname() == "prop_door_rotating" || shov.GetClassname() == "prop_door_rotating_checkpoint"))
			{
				local att = GetPlayerFromUserID(event.attacker);

				local movement_speed = ceil(att.GetVelocity().Length());

				local button_mask_pressed = NetProps.GetPropInt(att, "m_nButtons");

				if (movement_speed > 150)
				{

				}
			}
		}
	},

	function OnCommandEvent_e_plyr_door_vnt_open_enab (prompt)
	{
		enabled = true;
	},

	function OnCommandEvent_e_plyr_door_vnt_open_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDoorViolentOpen, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDoorViolentOpen, "OnCommandEvent_", "CommandEventCallbacks", null);
