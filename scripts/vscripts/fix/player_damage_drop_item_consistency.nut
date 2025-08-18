::PlayerDamageDropItemConsistency <-
{
	enabled = false,

	function OnGameEvent_player_incapacitated_start (event)
	{
		if (!enabled)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Third:
			case ItemSlot.Fifth:
			case ItemSlot.Sixth:

				break;

			default:

				pl.DropItem(act_weapon.GetClassname());

				break;
		}
	},

	function OnGameEvent_player_ledge_grab (event)
	{
		if (!enabled)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Third:
			case ItemSlot.Fifth:
			case ItemSlot.Sixth:

				break;

			default:

				pl.DropItem(act_weapon.GetClassname());

				break;
		}
	},

	function OnGameEvent_charger_carry_start (event)
	{
		if (!enabled)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Third:
			case ItemSlot.Fifth:
			case ItemSlot.Sixth:

				break;

			default:

				if (RandomInt(0, 99) < 40)
				{
					pl.DropItem(act_weapon.GetClassname());
				}

				break;
		}
	},

	function OnGameEvent_lunge_pounce (event)
	{
		if (!enabled)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		if (event.distance >= 800)
		{
			switch (act_weapon_slot)
			{
				case ItemSlot.Second:
				case ItemSlot.Sixth:

					break;

				default:

					if (RandomInt(0, 99) < 60)
					{
						pl.DropItem(act_weapon.GetClassname());
					}

					break;
			}
		}

		else
		{
			switch (act_weapon_slot)
			{
				case ItemSlot.Second:
				case ItemSlot.Third:
				case ItemSlot.Fifth:
				case ItemSlot.Sixth:

					break;

				default:

					if (RandomInt(0, 99) < 20)
					{
						pl.DropItem(act_weapon.GetClassname());
					}

					break;
			}
		}
	},

	function OnGameEvent_jockey_ride (event)
	{
		if (!enabled)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Third:
			case ItemSlot.Fifth:
			case ItemSlot.Sixth:

				break;

			default:

				if (RandomInt(0, 99) < 20)
				{
					player.DropItem(act_weapon.GetClassname());
				}

				break;
		}
	},

	function OnGameEvent_tongue_grab (event)
	{
		if (!enabled)
		{
			return;
		}

		local perp = GetPlayerFromUserID(event.userid);

		if (perp.IsDying())
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.victim);

		if (!pl.IsDominatedBySpecialInfected())
		{
			return;
		}

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Third:
			case ItemSlot.Fifth:
			case ItemSlot.Sixth:

				break;

			default:

				if (RandomInt(0, 99) < 20)
				{
					pl.DropItem(act_weapon.GetClassname());
				}

				break;
		}
	},

	function OnGameEvent_player_hurt (event)
	{
		if (!enabled)
		{
			return;
		}

		if (event.weapon != "tank_claw" && event.weapon != "tank_rock")
		{
			return;
		}

		if (event.type != 128)
		{
			return;
		}

		local pl = GetPlayerFromUserID(event.userid);

		local act_weapon = pl.GetActiveWeapon();

		local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

		switch (act_weapon_slot)
		{
			case ItemSlot.Second:
			case ItemSlot.Sixth:

				break;

			default:

				if (RandomInt(0, 99) < 60)
				{
					pl.DropItem(act_weapon.GetClassname());
				}

				break;
		}
	},

	function OnConsoleEvent_f_pl_dam_drop_item_cons_enab (prompt)
	{
		enabled = true;
	},

	function OnConsoleEvent_f_pl_dam_drop_item_cons_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDamageDropItemConsistency, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDamageDropItemConsistency, "OnConsoleEvent_", "ConsoleEventCallbacks", null);
