{
  networking = {
    networkmanager.enable = true;

    hosts = {
      "127.0.0.1" = [
        "tko-aly.localhost"
        "www.tko-aly.localhost"
        "admin.tko-aly.localhost"
        "members.tko-aly.localhost"
        "users.tko-aly.localhost"
        "event-api.tko-aly.localhost"
        "adminer.tko-aly.localhost"
        "jobs.tko-aly.localhost"
        "bbat.tko-aly.localhost"
        "beta.tko-aly.localhost"
      ];
      "::1" = [
        "tko-aly.localhost"
        "www.tko-aly.localhost"
        "admin.tko-aly.localhost"
        "members.tko-aly.localhost"
        "users.tko-aly.localhost"
        "event-api.tko-aly.localhost"
        "adminer.tko-aly.localhost"
        "jobs.tko-aly.localhost"
        "bbat.tko-aly.localhost"
        "beta.tko-aly.localhost"
      ];
    };

  };
}
