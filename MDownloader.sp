#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {
	name = "MDownloader",
	author = "Mozze",
	description = "",
	version = "1.0",
	url = "t.me/pMozze"
};

public void OnMapStart() {
	File file = OpenFile("addons/sourcemod/configs/MDownloader.txt", "r");

	if (file != null) {
		char Line[PLATFORM_MAX_PATH];

		while (file.ReadLine(Line, sizeof(Line))) {
			TrimString(Line);

			if (FileExists(Line))
				AddFileToDownloadsTable(Line);
		}

		delete file;
	}
}