::PlayerDropItem <-
{
	enabled = false,

	function GetRestantWeapon (inv, except)
	{
		local collec =
		[
			ItemSlot.First,
			ItemSlot.Second,
		]

		foreach (slot in collec)
		{
			if (slot != except && slot in inv)
			{
				return inv[slot];
			}
		}
	},

	function OnGameEvent_entity_shoved (event)
	{
		if (enabled)
		{
			if (EntIndexToHScript(event.entityid) == null)
			{
				local player = GetPlayerFromUserID(event.attacker);

				local button_mask_pressed = NetProps.GetPropInt(player, "m_nButtons");

				if ((button_mask_pressed & ButtonMask.Walk) && (button_mask_pressed & ButtonMask.Use))
				{
					local act_weapon = player.GetActiveWeapon();

					local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

					switch (act_weapon_slot)
					{
						case ItemSlot.First:
						case ItemSlot.Second:

							local inv = {}

							GetInvTable(player, inv);

							local rest_inv_weapon = GetRestantWeapon(inv, act_weapon_slot);

							if (rest_inv_weapon != null)
							{
								player.SwitchToItem(rest_inv_weapon.GetClassname());

								player.DropItem(act_weapon.GetClassname());

								# Hay que agragar lineas de dialogo.
							}

							break;

						case ItemSlot.Sixth:

							break;

						default:

							player.DropItem(act_weapon.GetClassname());

							# Hay que agragar lineas de dialogo.

							break;
					}
				}
			}
		}
	},

	function OnCommandEvent_e_pl_drop_item_enab (prompt)
	{
		enabled = true;
	},

	function OnCommandEvent_e_pl_drop_item_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDropItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDropItem, "OnCommandEvent_", "CommandEventCallbacks", null);
