#
# Soluciona la inconsistencia de reaparecer en habitaciones faciles de escapar.
#

::DoorSpawnConsistency <-
{
	function OnCommandEvent_f_door_spawn_cnstnc_enab (prompt)
	{
	},

	function OnCommandEvent_f_door_spawn_cnstnc_disab (prompt)
	{
	},
}

__CollectEventCallbacks(DoorSpawnConsistency, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(DoorSpawnConsistency, "OnCommandEvent_", "CommandEventCallbacks", null);
