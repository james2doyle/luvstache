local luvstache = require("../luvstache")

local fs = require('fs')

local view_model = {
    beatles = {
        { first_name = "John", last_name = "Lennon" },
        { first_name = "Paul", last_name = "McCartney" },
        { first_name = "George", last_name = "Harrison" },
        { first_name = "Ringo", last_name = "Starr" }
    },
    name = function (self)
        return self.first_name .. " " .. self.last_name
    end,
    title = "Tater",
    bold = function (text, render)
        return "<b>" .. render(text) .. "</b>"
    end,
    repos = {},
    musketeers = { "Athos", "Aramis", "Porthos", "D'Artagnan" },
    person = false
}

local file = fs.readFileSync('./template.mustache')

local output = luvstache:render(file, view_model)

print('Input:\n', file, '\nOutput:\n', output)


