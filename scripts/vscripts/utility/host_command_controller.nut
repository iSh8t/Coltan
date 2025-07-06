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
