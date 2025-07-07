#
# Añade la capacidad de tirar objetos a los jugadores.
#

::PlayerDropItem <-
{
	enabled = false

	function OnGameEvent_entity_shoved (event)
	{
		# Comprueba si la entidad empujada es una superficie.
		if (enabled && EntIndexToHScript(event.entityid) == null)
		{
			local att = GetPlayerFromUserID(event.attacker);

			# Comprueba si se incluye entre las teclas utilizadas la "e".
			if (att.GetButtonMask() & (1 << 5))
			{
				local act_item_id = att.GetActiveWeapon().GetClassname();

				# Comprueba si el objeto no es un cargable.
				if (!IsSixthItemSlot(act_item_id))
				{
					# Comprueba si el objeto no es un arma.
					if (IsFirstItemSlot(act_item_id) || IsSecondItemSlot(act_item_id))
					{
						local inv = {}

						GetInvTable(att, inv);

						# Comprueba si al menos se disponen de dos armas.
						if ("slot0" in inv && "slot1" in inv)
						{
							att.DropItem(act_item_id);
						}
					}

					else
					{
						att.DropItem(act_item_id);
					}
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
