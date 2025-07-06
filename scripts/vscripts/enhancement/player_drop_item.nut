#
# Añade la capacidad de tirar objetos a los jugadores.
#

::PlayerDropItem <-
{
	enabled = false

	function OnGameEvent_entity_shoved (event)
	{
		if (enabled)
		{
			local ent = GetPlayerFromUserID(event.attacker);

			if ((ent.GetButtonMask() & (1 << 5)) > 0 && EntIndexToHScript(event.entityid) == null)
			{
				local act_item_id = ent.GetActiveWeapon().GetClassname();

				local act_item_slot = GetItemSlot(act_item_id);

				if (act_item_slot == "slot0" || act_item_slot == "slot1")
				{
					local inv = {}

					GetInvTable(ent, inv);

					if ("slot0" in inv && "slot1" in inv)
					{
						ent.DropItem(act_item_id);
					}
				}

				else
				{
					ent.DropItem(act_item_id);
				}
			}
		}
	}

	function OnCommandEvent_e_plyr_dp_item_enab (prompt)
	{
		enabled = true;
	}

	function OnCommandEvent_e_plyr_dp_item_disab (prompt)
	{
		enabled = false;
	}
}

__CollectEventCallbacks(PlayerDropItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDropItem, "OnCommandEvent_", "CommandEventCallbacks", null);
