local g = require("globals")

remote.add_interface("baketorio.technology",
    {
        getPrerequisites = function ()
            return baketorio.techPrereqs
        end,
        getCosts = function ()
            return baketorio.sciencePackCosts
        end
        -- setPrerequisites
        -- setCosts
        -- resetPrerequisites
        -- resetCosts
    }
)

remote.add_interface("baketorio.module",
    {
        resetStorage = function ()
            return g.rebuildStorage()
        end
    }
)
