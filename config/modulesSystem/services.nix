{config, pkgs, ...}:
{
    services.httpd.enable = true;
    services.mysql = {
    enable = true;
    package = pkgs.mysql80;
    };
    services.postgresql={
    enable=true;
    package = pkgs.postgresql_16;
    };
    services.openssh.enable = true;
}
