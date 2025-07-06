local file_content = FileToString("coltan");

if (file_content != null)
{
	foreach (text in split(file_content, "\n"))
	{
		local prompt = GetPrompt(text);

		if (prompt.len() >= 1)
		{
			__RunEventCallbacks(prompt[0], prompt.slice(1), "OnCommandEvent_", "CommandEventCallbacks", false);
		}
	}
}
