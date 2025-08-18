::PlayerDropItem <-
{
	enabled = false,

	function GetRestantWeapon (inv, exc)
	{
		local collec =
		[
			ItemSlot.First,
			ItemSlot.Second,
		]

		foreach (v in collec)
		{
			if (v in inv && v != exc)
			{
				return inv[v];
			}
		}
	},

	function OnGameEvent_entity_shoved (event)
	{
		if (!enabled)
		{
			return;
		}

		if (event.entityid != 0)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.attacker);

		local button_mask = NetProps.GetPropInt(pl, "m_nButtons");

		local valid_button_mask = (button_mask & ButtonMask.Walk) && (button_mask & ButtonMask.Use);

		if (!valid_button_mask)
		{
			return;
		}

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.First:
			case ItemSlot.Second:

				local inv = {}

				GetInvTable(pl, inv);

				local rest_inv_weapon = GetRestantWeapon(inv, act_weapon_slot);

				if (rest_inv_weapon == null)
				{
					return;
				}

				pl.SwitchToItem(rest_inv_weapon.GetClassname());

				pl.DropItem(act_weapon.GetClassname());

				break;

			case ItemSlot.Sixth:

				break;

			default:

				pl.DropItem(act_weapon.GetClassname());

				break;
		}
	},

	function OnConsoleEvent_e_pl_drop_item_enab (prompt)
	{
		enabled = true;
	},

	function OnConsoleEvent_e_pl_drop_item_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDropItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDropItem, "OnConsoleEvent_", "ConsoleEventCallbacks", null);
