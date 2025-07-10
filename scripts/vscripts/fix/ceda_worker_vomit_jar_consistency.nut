#
# Soluciona la inconsistencia de los trabajadores infectados de CEDA, siendo afectados por las bilis de Boomer.
#

::CEDAWorkerVomitJarConsistency <-
{
	function OnCommandEvent_f_wrkr_bile_cnstnc_enab (prompt)
	{
	},

	function OnCommandEvent_f_wrkr_bile_cnstnc_disab (prompt)
	{
	},
}

__CollectEventCallbacks(CEDAWorkerVomitJarConsistency, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

__CollectEventCallbacks(CEDAWorkerVomitJarConsistency, "OnCommandEvent_", "CommandEventCallbacks", null);
