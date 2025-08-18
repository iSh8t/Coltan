local file_content = FileToString("coltan");

if (file_content == null)
{
	return;
}

foreach (text in split(file_content, "\n"))
{
	local prompt = GetPrompt(text);

	if (prompt.len() < 1)
	{
		return;
	}

	__RunEventCallbacks(prompt[0], prompt.slice(1), "OnConsoleEvent_", "ConsoleEventCallbacks", false);
}
