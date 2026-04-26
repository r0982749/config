return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio", -- required by nvim-dap-ui
        },
        config = function()
            require("config.dap")
        end,
    },
}
