#
# Añade la capacidad de dar objetos a los jugadores.
#

::PlayerGiveItem <-
{
	enabled = false,

	function Follow (data)
	{
		local att = GetPlayerFromUserID(data.giver);
		local shov = GetPlayerFromUserID(data.taker);

		local act_item = Ent(data.item);

		local act_item_id = act_item.GetClassname();

		shov.GiveItemWithSkin(act_item_id, NetProps.GetPropInt(act_item, "m_nSkin"));

		DoEntFire("!self", "Kill", "", 0, null, act_item);

		EmitSoundOnClient("Hint.LittleReward", att);

		# Comprueba si el inventario final es de un bot.
		if (!IsPlayerABot(shov))
		{
			EmitSoundOnClient("Hint.LittleReward", shov);

			shov.SwitchToItem(act_item_id);
		}
	},

	function OnGameEvent_player_shoved (event)
	{
		if (enabled)
		{
			local att = GetPlayerFromUserID(event.attacker);

			local act_item = att.GetActiveWeapon();

			local act_item_id = act_item.GetClassname();

			# Comprueba si es un objeto lanzable o de curacion.
			if (IsThirdItemSlot(act_item_id) || IsFourthItemSlot(act_item_id))
			{
				local act_item_slot = GetItemSlot(act_item_id);

				local shov = GetPlayerFromUserID(event.userid);

				local inv = {}

				GetInvTable(shov, inv);

				# Comprueba si es obtenible el objeto en el inventario final.
				if (!(act_item_slot in inv))
				{
					att.DropItem(act_item_id);

					act_item.SetOrigin(att.EyePosition() + att.EyeAngles().Left().Scale(10) + att.EyeAngles().Up().Scale(-15));

					local impulse = act_item.GetVelocity().Scale(0.3);

					impulse.z = 222;

					impulse += att.EyeAngles().Forward().Scale(100);

					act_item.SetVelocity(Vector(0, 0, 0));

					act_item.ApplyAbsVelocityImpulse(impulse);

					local dist = (act_item.GetOrigin() - shov.GetOrigin()).Length();

					local delay = dist / 550;

					delay = (delay < 0.1) ? 0.1 : delay;

					local sent =
					{
						giver = att.GetPlayerUserId(), taker = shov.GetPlayerUserId(),

						item = act_item.GetEntityIndex(),
					}

					EntFire("worldspawn", "RunScriptCode", "g_ModeScript.PlayerGiveItem.Follow(" + Serialize(sent) + ");", delay);
				}
			}
		}
	},

	function OnCommandEvent_e_plyr_gv_item_enab (prompt)
	{
		enabled = true;
	},

	function OnCommandEvent_e_plyr_gv_item_disab (prompt)
	{
		enabled = false;
	},
}

__CollectEventCallbacks(PlayerGiveItem, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(PlayerGiveItem, "OnCommandEvent_", "CommandEventCallbacks", null);
