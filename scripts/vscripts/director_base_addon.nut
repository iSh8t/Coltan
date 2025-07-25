enum ButtonMask
{
	Shoot = 1,
	Jump = 2,
	Duck = 4,
	Forward = 8,
	Back = 16,
	Use = 32,
	Cancel = 64,
	Left = 512,
	Right = 1024,
	Shove = 2048,
	Reload = 8192,
	Walk = 131072,
}

enum ItemSlot
{
	First = "slot0",
	Second = "slot1",
	Third = "slot2",
	Fourth = "slot3",
	Fifth = "slot4",
	Sixth = "slot5",
}

::Coltan <-
{
	version =
	{
		major = 0, minor = 3, revision = 0,
	},
}

::GetPrompt <- function (text)
{
	local res = []

	foreach (v in split(text, " "))
	{
		if (v != null && v != "")
		{
			res.append(v);
		}
	}

	return res;
}

::IsFirstItemSlot <- function (id)
{
	local collec =
	[
		"weapon_rifle",
		"weapon_rifle_ak47",
		"weapon_rifle_desert",
		"weapon_rifle_m60",
		"weapon_rifle_sg552",
		"weapon_hunting_rifle",
		"weapon_pumpshotgun",
		"weapon_autoshotgun",
		"weapon_shotgun_chrome",
		"weapon_shotgun_spas",
		"weapon_smg",
		"weapon_smg_mp5",
		"weapon_smg_silenced",
		"weapon_sniper_awp",
		"weapon_sniper_military",
		"weapon_sniper_scout",
		"weapon_grenade_launcher",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::IsSecondItemSlot <- function (id)
{
	local collec =
	[
		"weapon_pistol",
		"weapon_pistol_magnum",
		"weapon_melee",
		"weapon_chainsaw",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::IsThirdItemSlot <- function (id)
{
	local collec =
	[
		"weapon_pipe_bomb",
		"weapon_molotov",
		"weapon_vomitjar",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::IsFourthItemSlot <- function (id)
{
	local collec =
	[
		"weapon_first_aid_kit",
		"weapon_defibrillator",
		"weapon_upgradepack_explosive",
		"weapon_upgradepack_incendiary",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::IsFifthItemSlot <- function (id)
{
	local collec =
	[
		"weapon_adrenaline",
		"weapon_pain_pills",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::IsSixthItemSlot <- function (id)
{
	local collec =
	[
		"weapon_gnome",
		"weapon_cola_bottles",
		"weapon_gascan",
		"weapon_oxygentank",
		"weapon_propanetank",
		"weapon_fireworkcrate",
	]

	foreach (v in collec)
	{
		if (v == id)
		{
			return true;
		}
	}

	return false;
}

::GetItemSlot <- function (id)
{
	local collec =
	[
		IsFirstItemSlot,
		IsSecondItemSlot,
		IsThirdItemSlot,
		IsFourthItemSlot,
		IsFifthItemSlot,
		IsSixthItemSlot,
	]

	foreach (k, func in collec)
	{
		if (func.call(this, id))
		{
			return "slot" + k;
		}
	}
}

IncludeScript("enhance/player_drop_item", getroottable());

IncludeScript("fix/player_damage_consistency", getroottable());

IncludeScript("utility/configuration_file_loader", getroottable());
IncludeScript("utility/host_command_listener", getroottable());
