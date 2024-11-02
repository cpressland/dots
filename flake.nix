{
    description = "Dotfiles, now with flakey goodness";

    outputs = _: {
        self = import ./.;
    };
}
