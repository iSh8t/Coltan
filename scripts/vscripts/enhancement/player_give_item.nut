#
# Añade la capacidad de dar objetos a los jugadores.
#

::PlayerGiveItem <-
{
	enabled = false

	function OnGameEvent_player_shoved (event)
	{
		if (enabled)
		{
			local att = GetPlayerFromUserID(event.attacker);

			local act_item = att.GetActiveWeapon();

			local act_item_id = act_item.GetClassname();

			if (IsThirdItemSlot(act_item_id) || IsFourthItemSlot(act_item_id))
			{
				local act_item_slot = GetItemSlot(act_item_id);

				local shov = GetPlayerFromUserID(event.userid);

				local inv = {}

				GetInvTable(shov, inv);

				if (!(act_item_slot in inv))
				{
					att.DropItem(act_item_id);

					act_item.SetOrigin(att.EyePosition() + att.EyeAngles().Left().Scale(10) + att.EyeAngles().Up().Scale(-15));

					local impulse = act_item.GetVelocity().Scale(0.3);

					impulse.z = 222;

					impulse += att.EyeAngles().Forward().Scale(100);

					act_item.SetVelocity(Vector(0, 0, 0));
					act_item.ApplyAbsVelocityImpulse(impulse);
				}
			}
		}
	}

	function OnCommandEvent_e_plyr_gv_item_enab (prompt)
	{
		enabled = true;
	}

	function OnCommandEvent_e_plyr_gv_item_disab (prompt)
	{
		enabled = false;
	}
}

__CollectEventCallbacks(PlayerGiveItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerGiveItem, "OnCommandEvent_", "CommandEventCallbacks", null);
