::PlayerViolentOpenDoor <-
{
	enabled = true,

	function OnGameEvent_entity_shoved (event)
	{
		if (enabled)
		{
			local ent = EntIndexToHScript(event.entityid);

			if (ent != null && (ent.GetClassname() == "prop_door_rotating" || ent.GetClassname() == "prop_door_rotating_checkpoint"))
			{
				local player = GetPlayerFromUserID(event.attacker);

				local movement_speed = ceil(player.GetVelocity().Length());

				local button_mask_pressed = NetProps.GetPropInt(player, "m_nButtons");

				if (movement_speed > 150)
				{
					local door_locked = NetProps.GetPropInt(ent, "m_bLocked");
					local door_status = NetProps.GetPropInt(ent, "m_eDoorState");

					if (!door_locked && (door_status == 0 || door_status == 1 || door_status == 4))
					{
						EmitSoundOnClient("Hint.LittleReward", player);
					}
				}
			}
		}
	},
}

__CollectEventCallbacks(PlayerViolentOpenDoor, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerViolentOpenDoor, "OnCommandEvent_", "CommandEventCallbacks", null);
