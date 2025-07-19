::PlayerDropItem <-
{
	enabled = false,

	function OnGameEvent_entity_shoved (event)
	{
		if (enabled)
		{
			if (EntIndexToHScript(event.entityid) == null)
			{
				local att = GetPlayerFromUserID(event.attacker);

				local button_mask = att.GetButtonMask();

				if ((button_mask & ButtonMask.Walk) && (button_mask & ButtonMask.Use))
				{
					local act_weapon = att.GetActiveWeapon();

					local act_weapon_id = act_weapon.GetClassname();

					if (IsFirstItemSlot(act_weapon_id) || IsSecondItemSlot(act_weapon_id))
					{
						local inv = {}

						GetInvTable(att, inv);

						if (ItemSlot.First in inv && ItemSlot.Second in inv)
						{
							att.DropItem(act_weapon_id);
						}
					}

					else
					{
						if (!IsSixthItemSlot(act_weapon_id))
						{
							att.DropItem(act_weapon_id);
						}
					}
				}
			}
		}
	},

	function OnCommandEvent_e_plyr_dp_item_enab (prompt)
	{
		enabled = true;
	},

	function OnCommandEvent_e_plyr_dp_item_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDropItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDropItem, "OnCommandEvent_", "CommandEventCallbacks", null);
