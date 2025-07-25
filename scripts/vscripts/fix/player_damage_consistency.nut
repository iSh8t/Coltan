::PlayerDamageConsistency <-
{
	enabled = false,

	function OnGameEvent_player_incapacitated_start (event)
	{
		if (enabled)
		{
			local player = GetPlayerFromUserID(event.userid);

			local act_weapon = player.GetActiveWeapon();

			local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

			switch (act_weapon_slot)
			{
				case ItemSlot.Second:
				case ItemSlot.Third:
				case ItemSlot.Fifth:
				case ItemSlot.Sixth:

					break;

				default:

					player.DropItem(act_weapon.GetClassname());

					break;
			}
		}
	},

	function OnGameEvent_player_ledge_grab (event)
	{
		if (enabled)
		{
			local player = GetPlayerFromUserID(event.userid);

			local act_weapon = player.GetActiveWeapon();

			local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

			switch (act_weapon_slot)
			{
				case ItemSlot.Second:
				case ItemSlot.Third:
				case ItemSlot.Fifth:
				case ItemSlot.Sixth:

					break;

				default:

					player.DropItem(act_weapon.GetClassname());

					break;
			}
		}
	},

	function OnGameEvent_charger_carry_start (event)
	{
		if (enabled)
		{
			local player = GetPlayerFromUserID(event.victim);

			local act_weapon = player.GetActiveWeapon();

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
						player.DropItem(act_weapon.GetClassname());
					}

					break;
			}
		}
	},

	function OnGameEvent_lunge_pounce (event)
	{
		if (enabled)
		{
			local player = GetPlayerFromUserID(event.victim);

			local act_weapon = player.GetActiveWeapon();

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
							player.DropItem(act_weapon.GetClassname());
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
							player.DropItem(act_weapon.GetClassname());
						}

						break;
				}
			}
		}
	},

	function OnGameEvent_jockey_ride (event)
	{
		if (enabled)
		{
			local player = GetPlayerFromUserID(event.victim);

			local act_weapon = player.GetActiveWeapon();

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
		}
	},

	#
	function OnGameEvent_tongue_grab (event)
	{
		if (enabled)
		{
			local ent = GetPlayerFromUserID(event.userid);

			local player = GetPlayerFromUserID(event.victim);

			if (!ent.IsDying() && player.IsDominatedBySpecialInfected())
			{
				local act_weapon = player.GetActiveWeapon();

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
			}
		}
	},

	#
	function OnGameEvent_player_hurt (event)
	{
		if (enabled)
		{
			if (event.type == 128 && (event.weapon == "tank_claw" || event.weapon == "tank_rock"))
			{
				local player = GetPlayerFromUserID(event.userid);

				local act_weapon = player.GetActiveWeapon();

				local act_weapon_slot = GetItemSlot(act_weapon.GetClassname());

				switch (act_weapon_slot)
				{
					case ItemSlot.Second:
					case ItemSlot.Sixth:

						break;

					default:

						if (RandomInt(0, 99) < 60)
						{
							player.DropItem(act_weapon.GetClassname());
						}

						break;
				}
			}
		}
	},

	function OnCommandEvent_f_pl_damage_cons_enab (prompt)
	{
		enabled = true;
	},

	function OnCommandEvent_f_pl_damage_cons_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerDamageConsistency, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerDamageConsistency, "OnCommandEvent_", "CommandEventCallbacks", null);
