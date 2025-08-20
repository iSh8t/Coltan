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

::Coltan <-
{
	version =
	{
		major = 0, minor = 4, revision = 1
	}
}

IncludeScript("helper/player_item_slot", getroottable());

IncludeScript("enhance/player_drop_item", getroottable());
IncludeScript("enhance/player_open_door_shove", getroottable());

IncludeScript("fix/player_damage_drop_item_consistency", getroottable());
IncludeScript("fix/door_checkpoint_open_consistency", getroottable());

IncludeScript("handler/configuration_file_loader", getroottable());
IncludeScript("handler/host_command_listener", getroottable());
