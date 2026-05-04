{config, pkgs, ...}:
{
    users.users.xyconix = {
    isNormalUser = true;
    description = "xyconix";
    extraGroups = ["networkmanager" "wheel" "docker"];
    };
}
