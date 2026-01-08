{ pkgs, inputs, ... }:

{
    home-manager.users.solounrandom = {
        imports = [
	    inputs.noctalia.homeModules.default
	];

	programs.noctalia-shell = {
	    enable = true;
	    settings = {
	        bar = {
		    density = "default";
		    position = "top";
		    showCapsule = "false";
		    widgets = {
			left = [
			    {
				id = "ControlCenter";
				useDistroLogo = true;
			    }
			    {
				id = "WiFi";
			    }
			    {
				id = "Bluetooth";
			    }
			];
			center = [
			    {
				hideUnoccupied = false;
				id = "Workspace";
				labelMode = "none";
			    }
			];
			right = [
			    {
				alwaysShowPercentage = false;
				id = "Battery";
				warningThreshold = 20;
			    }
			    {
				formatHorizontal = "HH:mm";
				formatVertical = "HH mm";
				id = "Clock";
				useMonospacedFont = true;
				usePrimaryColor = true;
			    }
			];
		    };
		};
		colorSchemes.predefinedScheme = "Tokyo Night";
		general = {
		    avatarImage = "/home/solounrandom/.face";
		    radiusRatio = 0.2;
		};
		location = {
		    monthBeforeDay = true;
		    name = "Valencia, Venezuela";
		};
	    };
	};
    };
}
