return {
  {
    "giusgad/pets.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "edluffy/hologram.nvim"
    },
    cmd = {
      "PetsNew",
      "PetsNewCustom",
      "PetsList",
      "PetsKill",
      "PetsKillAll",
      "PetsPauseToggle",
      "PetsHideToggle",
      "PetsSleepToggle",
    },
    config = function(_, opts)
      require("pets").setup(opts)
    end
  }
}
