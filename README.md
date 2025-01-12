<h1 align="center"> fcitx5-switch.nvim </h1>
<h3 align="right">

*——A [Neovim](https://github.com/neovim/neovim) plugin for automatically activate/inactivate [Fcitx5](https://github.com/fcitx/fcitx5).*

</h3>

## Dependencies

- [Fcitx5](https://github.com/fcitx/fcitx5)

## Install

**lazy.nvim**

```lua
{
  "Buer-Nahida/fcitx5-switch.nvim",
  config = true,
}
```

if you only want inactivating fcitx5 when you on normal mode, you can add `recover = false` option.

```lua
{
  "Buer-Nahida/fcitx5-switch.nvim",
  opts = {
    recover = false,
  },
}
```
