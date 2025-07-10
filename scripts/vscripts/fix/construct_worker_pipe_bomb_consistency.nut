#
# Soluciona la inconsistencia de los trabajadores infectados de construcciones, siendo afectados por las bombas caseras.
#

::ConstructWorkerPipeBombConsistency <-
{
	function OnCommandEvent_f_wrkr_bile_cnstnc_enab (prompt)
	{
	},

	function OnCommandEvent_f_wrkr_bile_cnstnc_disab (prompt)
	{
	},
}

__CollectEventCallbacks(ConstructWorkerPipeBombConsistency, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(ConstructWorkerPipeBombConsistency, "OnCommandEvent_", "CommandEventCallbacks", null);
